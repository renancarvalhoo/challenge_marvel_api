module UpvoteHelper
  def favorite?(comic_id, favorites)
    favorites.include?(comic_id)
  end
end
