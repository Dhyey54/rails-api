class Comment < ApplicationRecord
  belongs_to :article
  validates :comment_content, :date_of_comment, presence: true

  paginates_per 15
end
