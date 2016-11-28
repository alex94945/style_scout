class AddPhotoToStyles < ActiveRecord::Migration

  def self.up
    add_attachment :styles, :photo
  end

  def self.down
    remove_attachment :styles, :photo
  end

end
