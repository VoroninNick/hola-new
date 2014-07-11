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
  end


  mount_uploader :main_image, AppartmentAvatarUploader


  before_save :check_page

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

      I18n.with_locale locale do
        # if p.path.nil? || p.path.length == 0
        #   p.path = "/#{locale.to_s}/appartments/#{self.name.parameterize}"
        # end

        if !p.translations_by_locale.keys.include?(locale)
          p.path = "/#{locale.to_s}/appartments/#{self.name.parameterize}"
        end
      end
    end

    p.save
  end



  rails_admin do
    # field :lat, :map do
    #   longitude_field :lng
    #   #google_api_key "a1b2c3d4e5f6deadbeef"
    #   default_latitude -34.0  # Sydney, Australia
    #   default_longitude 151.0
    # end

    field :name

    field :publish

    field :available

    field :recommended

    field :appartment_category

    field :region

    field :lat
    field :lng

    field :address

    field :price

    field :pages

    field :slider

    field :appartment_icons

    field :appartment_images

    field :main_image do
      label 'avatar'
    end

    field :intro_text do
      show
    end
    field :description do
      show
    end

    field :translations, :globalize_tabs

  end
end
