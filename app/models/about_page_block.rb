#encoding: utf-8

class AboutPageBlock < ActiveRecord::Base
  belongs_to :pages_about_page

  attr_accessible :content, :image, :alt, :title, :image_title#, :description

  mount_uploader :image, AboutBlockImageUploader

  translates :content, :alt, :title, :image_title
  accepts_nested_attributes_for :translations
  attr_accessible :translations_attributes, :translations

  class Translation
    attr_accessible :locale, :content, :alt, :title, :image_title



    rails_admin do
      field :locale do
        html_attributes  readonly: "readonly"
      end

      field :title do
        label "Заголовок"
      end

      field :content do
        show
        label "text"
      end

      field :alt do
        show
        label "alt (короткий опис картинки)"
      end

      field :image_title do
        show
        label "title (короткий заголовок картинки)"
      end
    end
  end



  rails_admin do

    field :title do
      label "Заголовок"
    end

    field :content, :ck_editor do
      label "текст"
    end
    field :image do
      label 'картинка'
    end
    field :alt do
      label "alt (короткий опис картинки)"
    end
    field :image_title do
      label "title (короткий заголовок картинки)"
    end
    field :translations, :globalize_tabs do
      label "переклад"
    end
  end
end
