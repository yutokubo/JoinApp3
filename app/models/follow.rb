class Follow < ApplicationRecord
  validates_uniqueness_of :community_id, scope: :user_id
  belongs_to :user
  belongs_to :community
end
