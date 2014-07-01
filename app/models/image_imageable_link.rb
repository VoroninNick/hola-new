class ImageImageableLink < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
  belongs_to :image, polymorphic: true
end
