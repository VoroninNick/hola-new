class AppartmentIcon < ActiveRecord::Base
  has_many :appartment_and_appartment_icon_links
  has_many :appartments, through: :appartment_and_appartment_icon_links


  attr_accessible :tooltip, :name, :image

  mount_uploader :image, AppartmentIconUploader
end
