class Article < ApplicationRecord
  has_many :comments
  validates :title, :body, :release_date, presence: true

  paginates_per 15
end
