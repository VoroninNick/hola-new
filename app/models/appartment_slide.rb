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

  attr_accessible :remove_image, :image_cache, :slider_type

  class Translation
    attr_accessible :title, :description, :locale
  end

  rails_admin do
    edit do
      field :title
      field :description
      field :image

      # field :translations, :globalize_tabs

      #field :tag_list do
      #  partial 'tag_list_with_suggestions'
      #end
    end
  end
end