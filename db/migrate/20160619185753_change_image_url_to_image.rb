class ChangeImageUrlToImage < ActiveRecord::Migration
  def change
    rename_column :users, :image_url, :image
  end
end
