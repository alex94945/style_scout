class AddPhotoRotationAngleToStyle < ActiveRecord::Migration
  def change
    add_column :attachments, :photo_rotate_angle, :integer, default: 0

  end
end
