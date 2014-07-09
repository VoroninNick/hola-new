class AppartmentCategory < ActiveRecord::Base
  attr_accessible :name, :description
  translates :name, :description
  accepts_nested_attributes_for :translations
  attr_accessible :translations_attributes, :translations

  has_many :appartments

  accepts_nested_attributes_for :appartments
  attr_accessible :appartments_attributes

  class Translation
    attr_accessible :name, :description
    attr_accessible :locale
  #
  #   rails_admin do
  #     edit do
  #       field :locale do
  #         html_attributes  readonly: "readonly"
  #       end
  #       field :name
  #       field :description
  #     end
  #   end
  end

  rails_admin do
    edit do
      field :name
      field :description
      # field :translations, :globalize_tabs
      field :appartments
    end
  end


end
