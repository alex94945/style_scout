class AddPhotosToAttachment < ActiveRecord::Migration
  def self.up
    add_attachment :attachments, :photo
    remove_attachment :styles, :photo
  end

  def self.down
    remove_attachment :styles, :photo
    add_attachment :attachments, :photo

  end
end
