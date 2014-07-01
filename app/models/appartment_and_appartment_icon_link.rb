class AppartmentAndAppartmentIconLink < ActiveRecord::Base
  belongs_to :appartment
  belongs_to :appartment_icon
end