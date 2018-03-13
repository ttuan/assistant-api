class UserComic < ApplicationRecord
  belongs_to :user
  belongs_to :comic

  validates :user_id, uniqueness: {scope: :comic_id}
end
