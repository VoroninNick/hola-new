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

  attr_accessible :render_from_appartment
  belongs_to :appartment
  attr_accessible :appartment, :appartment_id

  class Translation
    attr_accessible :title, :description, :locale, :link
  end

  rails_admin do
    edit do
      field :title
      field :description
      field :price
      field :link
      field :image

      field :render_from_appartment

      field :appartment

      # field :translations, :globalize_tabs

      #field :tag_list do
      #  partial 'tag_list_with_suggestions'
      #end
    end
  end

end