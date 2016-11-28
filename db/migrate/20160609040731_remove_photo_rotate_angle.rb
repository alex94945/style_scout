class RemovePhotoRotateAngle < ActiveRecord::Migration
  def change
    remove_column :attachments, :photo_rotate_angle
  end
end
