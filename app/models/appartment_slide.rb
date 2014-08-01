class AppartmentSlide < ActiveRecord::Base
  #self.table_name = 'slides'

  attr_accessible :title
  attr_accessible :description
  attr_accessible :image
  mount_uploader :image, AppartmentSlideImageUploader

  belongs_to :slider, polymorphic: true, class_name: 'AppartmentSlider'
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

  attr_accessible :remove_image, :image_cache, :slider_type

  class Translation
    attr_accessible :title, :description, :locale

    rails_admin do
      edit do
        field :locale, :hidden
        #field :
        field :globalized_model
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

      #field :translations, :globalize_tabs

      #field :tag_list do
      #  partial 'tag_list_with_suggestions'
      #end
    end
  end
end