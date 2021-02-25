class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :community, optional: true
  validates :content, presence: true, length: { maximum: 140 }
end
