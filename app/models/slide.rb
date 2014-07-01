class Slide < ActiveRecord::Base
  attr_accessible :title
  attr_accessible :descripton
  attr_accessible :image
  mount_uploader :image, ImageUploader

  belongs_to :slider
  attr_accessible :slider, :slider_id
end
