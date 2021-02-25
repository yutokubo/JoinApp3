class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
      t.references :user, foreign_key: true #外部キーとしての設定

      t.references :community, foreign_key: true

      t.index [:user_id, :community_id], unique: true#フォロー重複回避
      t.timestamps
    end
  end
end
