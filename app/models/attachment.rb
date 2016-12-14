class Attachment < ActiveRecord::Base
  belongs_to :style

  has_attached_file :photo, styles: {
    square: '200x200#',
    large: '800x800>'
  }

  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

end
