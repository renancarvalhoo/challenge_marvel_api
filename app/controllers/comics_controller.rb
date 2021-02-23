class ComicsController < ApplicationController
  LIMIT = 18

  def index
    @character_id = comics_params[:character_id] || find_character(comics_params[:character_name])
    comics_response = Marvel.comics(
      marvel_comic_parameters(
        comics_params[:page],
        comics_params[:orderBy] || '-onsaleDate',
        @character_id
      )
    ).fetch

    @page = comics_params[:page].to_i || 0
    @total_pages = comics_response['total'] / LIMIT
    ap @total_pages
    @favorites = Upvote.where(session_id: session.id.to_s).pluck(:comic_id)
    @comics = ComicsSerializer.new(comics_response['results']).serialize
  end

  private

  def comics_params
    params.permit(:page, :orderBy, :character_name, :character_id)
  end

  def page_offset(page)
    (page || 0).to_i * LIMIT
  end

  def marvel_comic_parameters(page, order_by, character)
    parameters = {
      offset: page_offset(page),
      limit: LIMIT,
      orderBy: order_by || '-onsaleDate'
    }

    parameters = parameters.merge(characters: character) if character.present?

    parameters
  end

  def find_character(name)
    return unless name

    Character.find_by('name ilike ?', "%#{name}%")&.marvel_id&.to_s
  end
end
