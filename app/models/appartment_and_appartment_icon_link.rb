class AppartmentAndAppartmentIconLink < ActiveRecord::Base
  belongs_to :appartment
  belongs_to :appartment_icon

  attr_accessible :appartment, :appartment_icon

end