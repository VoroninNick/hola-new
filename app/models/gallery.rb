class Gallery < ActiveRecord::Base
  has_many :gallery_images
  attr_accessible :gallery_images
  accepts_nested_attributes_for :gallery_images
end
