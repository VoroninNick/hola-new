class Image < ActiveRecord::Base
  has_many :image_imageable_links, as: :image
  has_many :imageables, through: :image_imageable_links, source: :imageable, source_type: 'Imageable'

  translates :title, :alt

  attr_accessible :imageables
  accepts_nested_attributes_for :translations
  attr_accessible :translations_attributes, :translations

  attr_accessible :title, :alt, :path, :file_name, :image
  mount_uploader :image, ImageUploader

  rails_admin do
    edit do
      include_all_fields
      # field :translations, :globalize_tabs
    end
  end
end
