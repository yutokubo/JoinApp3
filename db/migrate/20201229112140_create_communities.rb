class CreateCommunities < ActiveRecord::Migration[6.0]
  def change
    create_table :communities do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :body
      t.string :profile_image
      

      t.timestamps
    end
  end
end
