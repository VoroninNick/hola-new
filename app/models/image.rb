class Image < ActiveRecord::Base
  has_many :image_imageable_links, as: :image
  has_many :imageables, through: :image_imageable_links, source: :imageable, source_type: 'Imageable'

  attr_accessible :imageables

  attr_accessible :title, :alt, :path, :file_name, :image
  mount_uploader :image, ImageUploader
end
