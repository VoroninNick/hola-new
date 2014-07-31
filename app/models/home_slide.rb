class HomeSlide < ActiveRecord::Base
  #self.table_name = 'slides'

  attr_accessible :title
  attr_accessible :description
  attr_accessible :price
  attr_accessible :link
  attr_accessible :image
  mount_uploader :image, HomeSlideImageUploader

  belongs_to :slider, polymorphic: true, class_name: 'HomeSlider'
  attr_accessible :slider, :slider_id

  translates :title, :description
  accepts_nested_attributes_for :translations
  attr_accessible :translations_attributes, :translations

  before_save :save_original_locale

  def save_original_locale
    self.class.translated_attribute_names.each do |attr|
      self[attr] = self.translations_by_locale[I18n.locale][attr]
    end
  end

  attr_accessible :render_from_appartment
  belongs_to :appartment
  attr_accessible :appartment, :appartment_id

  class Translation
    attr_accessible :title, :description, :locale, :link

    rails_admin do
      include_all_fields
      field :locale do
        hide
      end
      field :globalized_model do
        hide
      end
    end
  end

  rails_admin do
    edit do
      field :title do
        hide
      end
      field :description do
        hide
      end

      field :image

      group :render_from_fields do
        active false

        field :price
        field :link

        field :translations, :globalize_tabs
      end

      group :render_from_appartment do
        active false

        field :render_from_appartment

        field :appartment

      end



      #field :tag_list do
      #  partial 'tag_list_with_suggestions'
      #end
    end
  end

end