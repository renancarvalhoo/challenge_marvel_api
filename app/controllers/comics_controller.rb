class ComicsController < ApplicationController
  LIMIT = 18

  def index
    character = find_character(comics_params[:character_name])
    comics_response = Marvel.comics(
      marvel_comic_parameters(
        page_offset(comics_params[:page]),
        comics_params[:orderBy] || '-onsaleDate',
        character
      )
    ).fetch

    @page = comics_params[:page].to_i || 0
    @total_pages = comics_response['total'] / LIMIT
    @favorites = Upvote.where(session_id: session.id.to_s).pluck(:comic_id)
    @comics = ComicsSerializer.new(comics_response['results']).serialize
  end

  private

  def comics_params
    params.permit(:page, :orderBy, :character_name)
  end

  def page_offset(page)
    (page || 0).to_i * LIMIT
  end

  def marvel_comic_parameters(page, order_by, characters)
    parameters = {
      offset: page_offset(page),
      limit: LIMIT,
      orderBy: order_by || '-onsaleDate'
    }

    parameters.merge(characters: characters) if characters.any?

    parameters
  end

  def find_character(name)
    character = Character.find_by('name = ?', "%#{name}%")

    character ? [character] : []
  end
end
