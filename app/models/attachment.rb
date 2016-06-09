class Attachment < ActiveRecord::Base
  belongs_to :style

  has_attached_file :photo, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  after_post_process :parse_exif_rotation


  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/


  private
    def parse_exif_rotation
      exif_data =  MiniExiftool.new(photo.queued_for_write[:original].path)
      rotation = exif_data[:orientation]
      if rotation.present?
        self.photo_rotate_angle = map_exif_to_degrees(rotation)
      end
    end


    def map_exif_to_degrees(rotation)
      angles = {
        'Horizontal (normal)' => 0,
        'Rotate 90 CW' => 90,
        'Rotate 180' => 180,
        'Rotate 270 CW' => 270,
        'Rotate 90 CCW' => -90,
        'Rotate 270 CCW' => -270,
      }

      angles[rotation]
    end
end
