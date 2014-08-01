class AppartmentIcon < ActiveRecord::Base
  #has_many :appartment_and_appartment_icon_links
  #has_many :appartments, through: :appartment_and_appartment_icon_links

  has_and_belongs_to_many :appartments, join_table: 'appartment_and_appartment_icon_links'


  attr_accessible :tooltip, :name, :image, :appartment_and_appartment_icon_links, :appartments

  mount_uploader :image, AppartmentIconUploader

  translates :tooltip
  accepts_nested_attributes_for :translations
  attr_accessible :translations_attributes, :translations

  class Translation
    attr_accessible :locale, :tooltip

    rails_admin do
      edit do
        field :tooltip
      end
    end
  end

  rails_admin do
    edit do

      field :name
      field :image

      field :translations, :globalize_tabs

      field :appartments
    end
  end
end
