class Comic < ApplicationRecord
  has_many :user_comics
  has_many :users, through: :user_comics
  validates :name, uniqueness: {scope: :url}
end
