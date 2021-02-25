class Community < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader

   has_many :follows, dependent: :destroy
   
   has_many :users, through: :follows #追加

   has_many :comments, dependent: :destroy

  with_options if: :published? do
    validates :title, presence: true
    validates :introduction, presence: true
   # 複数valitatesをまとめたい場合はwith_optionsを使用（published?はメソッド名またはmodelのboolean項目)
 end

 def published?
  false
 end





end
