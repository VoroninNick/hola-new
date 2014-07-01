class Imageable < ActiveRecord::Base
  has_many :image_imageable_links, as: :imageable
  has_many :images, through: :image_imageable_links, source: :image, source_type: 'Image'

  attr_accessible :images
end
