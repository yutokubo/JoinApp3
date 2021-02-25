class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :profile_image, ProfileImageUploader

  has_many :communities, dependent: :destroy

  has_many :follows, dependent: :destroy

  has_many :follow_communities, through: :follows #追加

  has_many :comments, dependent: :destroy

  def following?(community)
    self.follows.exists?(community_id: community.id)
  end

  def follow_id(community)
    self.follows.find_by(community_id: community.id)
  end

end
