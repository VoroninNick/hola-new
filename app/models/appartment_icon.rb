class AppartmentIcon < ActiveRecord::Base
  has_many :appartment_and_appartment_icon_links
  has_many :appartments, through: :appartment_and_appartment_icon_links


  attr_accessible :tooltip, :name, :image

  mount_uploader :image, AppartmentIconUploader

  translates :name, :tooltip
  accepts_nested_attributes_for :translations
  attr_accessible :translations_attributes, :translations

  class Translation
    attr_accessible :locale, :name, :tooltip
  end

  rails_admin do
    edit do
      include_all_fields
      # field :translations, :globalize_tabs
    end
  end
end
