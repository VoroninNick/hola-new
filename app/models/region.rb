class Region < ActiveRecord::Base
  attr_accessible :name, :description
  has_many :appartments
  attr_accessible :appartments

  translates :name, :description
  accepts_nested_attributes_for :translations
  attr_accessible :translations_attributes, :translations

  class Translation
    attr_accessible :name, :description, :locale
  end


  rails_admin do
    edit do
      field :name
      field :appartments
      # field :translations, :globalize_tabs
    end
  end
end
