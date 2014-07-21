#encoding: utf-8

class Region < ActiveRecord::Base
  attr_accessible :name, :description
  has_many :appartments
  attr_accessible :appartments

  translates :name, :description
  accepts_nested_attributes_for :translations
  attr_accessible :translations_attributes, :translations

  class Translation
    attr_accessible :name, :description, :locale

    rails_admin do
      edit do
        field :locale do
          html_attributes  readonly: "readonly"
        end

        field :name do
          label "Назва"
        end

        field :description do
          label 'Кввартири в цьому районі'
        end


      end
    end
  end


  rails_admin do
    navigation_label 'Район'
    edit do
      field :name do
        label "Назва"
      end
      field :appartments do
        label 'Кввартири в цьому районі'
      end
      field :translations, :globalize_tabs
    end
  end
end
