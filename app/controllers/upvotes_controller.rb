class UpvotesController < ApplicationController
  def create

    Upvote.create(session_id: session.id.to_s, comic_id: params[:comic_id])
    redirect_to root_path
  end

  def destroy
    Upvote.delete_by(session_id: session.id.to_s, comic_id: params[:comic_id])

    redirect_to root_path
  end

  private

  def permitted_params
    params.permit(:comic_id)
  end

  def redirect_to_root
    if @context.success?
      redirect_to root_path
    else
      redirect_to root_path, notice: @context.errors
    end
  end
end
