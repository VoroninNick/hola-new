class Photo < ActiveRecord::Base
  belongs_to :album

  attr_accessible :album_id, :album, :image, :remove_image, :image_cache

  mount_uploader :image, ImageUploader


end
