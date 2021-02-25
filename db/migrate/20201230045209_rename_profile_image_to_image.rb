class RenameProfileImageToImage < ActiveRecord::Migration[6.0]
  def change
    rename_column  :communities, :profile_image, :image
  end
end


