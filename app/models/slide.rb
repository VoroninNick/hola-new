class Slide < ActiveRecord::Base
  attr_accessible :title
  attr_accessible :description
  attr_accessible :image
  mount_uploader :image, ImageUploader

  belongs_to :slider, polymorphic: true
  attr_accessible :slider, :slider_id, :slider_type

  translates :title, :description
  accepts_nested_attributes_for :translations
  attr_accessible :translations_attributes, :translations

  class Translation
    attr_accessible :title, :description
    attr_accessible :locale
  #
  #   rails_admin do
  #     edit do
  #       field :locale do
  #         html_attributes  readonly: "readonly"
  #       end
  #       field :title
  #       field :description
  #     end
  #   end
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

    nested do
      field :slider do
        hide
      end
    end
  end
end
