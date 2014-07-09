class AppartmentImage < ActiveRecord::Base
  belongs_to :appartment

  attr_accessible :image, :alt, :description, :title, :publish, :appartment_id, :appartment

  translates :alt, :description, :title
  accepts_nested_attributes_for :translations
  attr_accessible :translations_attributes, :translations

  mount_uploader :image, AppartmentImageUploader

  attr_accessible :remove_image, :image_cache

  class Translation
    attr_accessible :locale, :alt, :description, :title
  end


  rails_admin do
    edit do
      field :image
      field :alt
      field :description
      field :title
      field :appartment
      # field :translations, :globalize_tabs
    end

    nested do
      field :appartment do
        hide
      end
    end
  end

end
