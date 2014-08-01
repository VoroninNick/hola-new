#encoding: utf-8

class AppartmentImage < ActiveRecord::Base
  belongs_to :appartment

  attr_accessible :image, :alt, :description, :title, :publish, :appartment_id, :appartment, :name

  translates :alt, :description, :title
  accepts_nested_attributes_for :translations
  attr_accessible :translations_attributes, :translations

  mount_uploader :image, AppartmentImageUploader

  attr_accessible :remove_image, :image_cache

  class Translation
    attr_accessible :locale, :alt, :description, :title

    rails_admin do
      field :locale, :hidden
      field :alt do
        label 'html alt'
      end
      field :title do
        label 'html title'
      end

      field :description do
        label 'опис картинки'
        help 'опис буде відображатись у слайдері'
      end
    end
  end


  rails_admin do
    edit do
      field :name do
        label "внутрішній ідентифікатор"
      end
      field :image do
        help "versions: thumb: resize_to_fill => [300, 300]; large_image: horizontal: resize_to_fill => [960, 600]; vertical: resize_to_fill => [600, 960]"
      end

      field :appartment
      field :translations, :globalize_tabs
    end

    nested do
      field :appartment do
        hide
      end
    end
  end

end
