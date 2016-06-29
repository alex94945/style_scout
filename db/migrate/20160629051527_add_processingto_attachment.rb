class AddProcessingtoAttachment < ActiveRecord::Migration
  def self.up
    add_column :attachments, :photo_processing, :boolean
  end

  def self.down
    remove_column :attachments, :photo_processing
  end
end
