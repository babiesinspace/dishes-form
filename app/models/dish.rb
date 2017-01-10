class Dish < ApplicationRecord
  validates :image, :name, presence: true
  # after_post_process :save_latlong

  has_attached_file :image, styles: { 
    thumb: '100x100>',
    square: '200x200#',
    :medium => "640x" }
    
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  private

  def save_latlong
    exif_data = MiniExiftool.new(image.queued_for_write[:original].path)
    self.latitude = parse_latlong(exif_data['gpslatitude'])
    self.longitude = parse_latlong(exif_data['gpslongitude'])
  end

  def parse_latlong(latlong)
    return unless latlong
    match, degrees, minutes, seconds, rotation = /(\d+) deg (\d+)' (.*)" (\w)/.match(latlong).to_a
    calculate_latlong(degrees, minutes, seconds, rotation)
  end

  def calculate_latlong(degrees, minutes, seconds, rotation)
    calculated_latlong = degrees.to_f + minutes.to_f/60 + seconds.to_f/3600
    ['S', 'W'].include?(rotation) ? -calculated_latlong : calculated_latlong
  end
  
end
