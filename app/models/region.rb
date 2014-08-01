#encoding: utf-8

class Region < ActiveRecord::Base
  attr_accessible :name, :description
  has_and_belongs_to_many :appartments, join_table: 'appartments_and_regions'
  attr_accessible :appartments

  translates :name, :description
  accepts_nested_attributes_for :translations
  attr_accessible :translations_attributes, :translations
  attr_accessible :priority

  #before_save :save_original_locale

  def save_original_locale
    if !new_record?
      self.class.translated_attribute_names.each do |attr|
        self[attr] = self.translations_by_locale[I18n.locale][attr]
      end
    end
  end

  class Translation
    attr_accessible :name, :description, :locale

    rails_admin do
      edit do
        include_all_fields

        field :locale do
          hide
        end
        field :globalized_model do
          hide
        end

        field :name do
          label "Назва"
        end

        field :description do
          label 'Опис'
        end


      end
    end
  end


  rails_admin do
    navigation_label 'Район'

    # new do
    #   field :name do
    #     show
    #   end
    #   field :description do
    #     show
    #   end
    #   field :translations, :globalize_tabs do
    #     show
    #   end
    #   field :priority do
    #     label "Приорітет"
    #     help "0 - для звичайних районів, 1 - для логічних. Наприклад: Галицький = 0; Центр = 1"
    #   end
    #   field :appartments do
    #     label 'Кввартири в цьому районі'
    #   end
    # end

    edit do
      field :name do
        show
        html_attributes({ style: "display: none" })
      end

      field :description do
        hide
      end

      field :translations, :globalize_tabs do
        show
      end
      field :priority do
        label "Приорітет"
        help "0 - для звичайних районів, 1 - для логічних. Наприклад: Галицький = 0; Центр = 1"
      end
      field :appartments do
        label 'Кввартири в цьому районі'
      end

    end


  end
end
