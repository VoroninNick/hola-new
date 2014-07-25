#encoding: utf-8

class Appartment < ActiveRecord::Base
  # base page data
  acts_as_page_block
  # has_many :page_block_links, as: :page_block
  # has_many :pages, through: :page_block_links
  # attr_accessible :pages
  #
  # accepts_nested_attributes_for :pages
  # attr_accessible :pages_attributes


  #attr_accessible :lat, :lng

  has_one :slider, as: :sliderable, class_name: 'AppartmentSlider'

  attr_accessible :slider

  accepts_nested_attributes_for :slider
  attr_accessible :slider_attributes

  belongs_to :appartment_category
  attr_accessible :appartment_category, :appartment_category_id

  belongs_to :region
  attr_accessible :region, :region_id

  #has_many :appartment_and_appartment_icon_links
  #has_many :appartment_icons, through: :appartment_and_appartment_icon_links
  has_and_belongs_to_many :appartment_icons, join_table: 'appartment_and_appartment_icon_links'

  attr_accessible :appartment_icons#, :appartment_and_appartment_icon_links

  attr_accessible :appartment_icon_ids, :main_image, :main_image_cache

  has_many :appartment_images

  accepts_nested_attributes_for :appartment_images
  attr_accessible :appartment_images_attributes, :appartment_images

  attr_accessible :lat, :lng, :price, :address, :publish, :available, :recommended, :name, :intro_text, :description

  translates :intro_text, :description, :address
  accepts_nested_attributes_for :translations
  attr_accessible :translations_attributes, :translations

  class Translation
    attr_accessible :locale, :intro_text, :description, :address



    rails_admin do
      field :locale do
        html_attributes  readonly: "readonly"
      end

      field :address do
        show
        label "адреса"
      end

      field :intro_text, :ck_editor do
        show
        label "Текст про квартиру(виводиться зразу під слайдером)"
      end

      field :description, :ck_editor do
        show
        label "Текст про квартиру(виводиться зразу під галереєю)"
      end
    end
  end


  mount_uploader :main_image, AppartmentAvatarUploader

  scope :published, -> { where(publish: 't').order('id desc') }
  scope :available, -> { published.where(available: 't').order('id desc') }
  scope :recommended, -> { available.where(recommended: 't').order('id desc') }


  after_save :check_page

  def check_page
    if pages.count == 0
      p = Page.new
      p.controller ||= 'appartments'
      p.action ||= 'item'
      p.layout ||= 'application'
      p.save
      pages.push p
    end

    p = page
    self.translations_by_locale.keys.each do |locale|

      if self.name.nil? || self.name.length == 0
        self.name = "appartment-#{id}"
      end



      if !p.translations_by_locale.keys.include?(locale) || ( p.path.nil? || p.path.length == 0 )
        translation = Page.translation_class.create!(locale: locale, page_id: self.id)
        translation.path = "/#{locale.to_s}/appartments/#{self.name.parameterize}"
        translation.save
        p.save
      end

      I18n.with_locale locale do
        # if p.path.nil? || p.path.length == 0
        #   p.path = "/#{locale.to_s}/appartments/#{self.name.parameterize}"
        # end


      end
    end

    p.save
  end



  rails_admin do
    edit do
      # field :lat, :map do
      #   longitude_field :lng
      #   #google_api_key "a1b2c3d4e5f6deadbeef"
      #   default_latitude -34.0  # Sydney, Australia
      #   default_longitude 151.0
      # end

      field :name do
        label "Ім'я квартири (використовуэться лише для url. якщо заповтите url вручну, може пропустити це поле)"
      end

      field :publish do
        label "Публікувати?"
      end

      field :available do
        label "доступна квартира?"
      end

      field :recommended do
        label "рекомендована?"
      end

      field :appartment_category do
        label "категорія квартири"
      end

      field :region do
        label "район квартири"
      end

      field :lat do
        label "координати квартири: широта"
        help "наприклад: 49.83445\nhttps://www.google.com/maps/place/Uhors'ka+St,+7%D0%90,+L'viv,+Lviv+Oblast,+Ukraine/@49.8123145,24.041031,17z/data=!3m1!4b1!4m2!3m1!1s0x473ae7fb1ae5a5a1:0xfb49271c412ed40d"
      end
      field :lng do
        label "координати квартири: довгота"
      end

      field :address do

        label "адреса (англійська мова)"
      end

      field :price do
        label "цына квартири за 1 день"
      end

      field :pages do
        label "інформація про сторінки"
      end

      field :slider do
        label "слайдер для квартири"
      end

      field :appartment_icons do
        label "Іконки"
      end

      field :appartment_images do
        label "Картинки"
      end

      field :main_image do
        label "Головна картинка(аватарка)"
      end

      field :intro_text, :ck_editor do
        show
        label "Текст про квартиру (англійська мова)\n(виводиться зразу під слайдером) "
      end
      field :description, :ck_editor do
        show
        label "Текст про квартиру (англійська мова)\n(виводиться зразу під галереєю)"
      end

      field :translations, :globalize_tabs do
        label "Переклад"
      end
    end
  end
end
