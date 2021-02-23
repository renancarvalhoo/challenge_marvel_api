class ComicsController < ApplicationController
  LIMIT = 18

  def index
    comics_response =
      Marvel.comics(
        offset: page_offset(comics_params[:page]),
        limit: LIMIT,
        orderBy: comics_params[:orderBy] || '-onsaleDate'
      ).fetch

    @page = comics_params[:page].to_i || 0
    @total_pages = comics_response['total'] / LIMIT
    @favorites = Upvote.where(session_id: session.id.to_s).pluck(:comic_id)
    @comics = ComicsSerializer.new(comics_response['results']).serialize
  end

  private

  def comics_params
    params.permit(:page, :orderBy)
  end

  def page_offset(page)
    (page || 0).to_i * LIMIT
  end
end
