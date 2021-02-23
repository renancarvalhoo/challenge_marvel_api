class Upvote < ApplicationRecord
  validates :comic_id, presence: true
  validates :session_id, presence: true
end
