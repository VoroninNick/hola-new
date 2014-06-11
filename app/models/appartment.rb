class Appartment < ActiveRecord::Base
  attr_accessible :lat, :lng

  rails_admin do
    field :lat, :map do
      longitude_field :lng
      #google_api_key "a1b2c3d4e5f6deadbeef"
      default_latitude -34.0  # Sydney, Australia
      default_longitude 151.0
    end
  end
end
