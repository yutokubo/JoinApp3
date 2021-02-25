class RenameProfileImageIdToProfileImage < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :profile_image_id, :profile_image
  end
end
