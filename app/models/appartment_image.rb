class AppartmentImage < ActiveRecord::Base
  belongs_to :appartment

  attr_accessible :image, :alt, :description, :title, :publish, :appartment_id, :appartment

  mount_uploader :image, AppartmentImageUploader
end
