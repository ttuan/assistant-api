class User < ApplicationRecord
  has_many :user_comics
  has_many :comics, through: :user_comics
end
