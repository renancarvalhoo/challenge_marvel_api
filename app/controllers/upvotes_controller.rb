class UpvotesController < ApplicationController
  def create
    Upvote.create(session_id: get_session, comic_id: permitted_params[:comic_id])
    redirect_to root_path
  end

  def destroy
    Upvote.delete_by(session_id: get_session, comic_id: permitted_params[:id])
    redirect_to root_path
  end

  private

  def permitted_params
    params.permit(:id, :comic_id, :session_id)
  end

  def get_session
    permitted_params[:session_id] || session.id.to_s
  end

  def redirect_to_root
    if @context.success?
      redirect_to root_path
    else
      redirect_to root_path, notice: @context.errors
    end
  end
end
