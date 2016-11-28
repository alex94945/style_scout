class UpdateDefaultPhotoAttachmentMethod < ActiveRecord::Migration
  def change
    rename_column :styles, :default_photo_id, :default_attachment_id
  end
end
