class Dish < ApplicationRecord
  validates :image, :name, :taste, :restaurant, :location, presence: true

  has_attached_file :image, styles: { 
    thumb: '100x100>',
    square: '200x200#',
    :medium => "640x" }

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
