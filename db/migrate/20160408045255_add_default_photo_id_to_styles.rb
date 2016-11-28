class AddDefaultPhotoIdToStyles < ActiveRecord::Migration
  def change
    add_column :styles, :default_photo_id, :integer
  end
end
