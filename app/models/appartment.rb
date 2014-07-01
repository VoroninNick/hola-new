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

  has_slider

  attr_accessible :slider

  accepts_nested_attributes_for :slider
  attr_accessible :slider_attributes

  belongs_to :region
  attr_accessible :region

  has_many :appartment_and_appartment_icon_links
  has_many :appartment_icons, through: :appartment_and_appartment_icon_links

  has_many :appartment_images

  accepts_nested_attributes_for :appartment_images
  attr_accessible :appartment_images_attributes


  rails_admin do
    # field :lat, :map do
    #   longitude_field :lng
    #   #google_api_key "a1b2c3d4e5f6deadbeef"
    #   default_latitude -34.0  # Sydney, Australia
    #   default_longitude 151.0
    # end

    field :region

    field :lat
    field :lng

    field :price

    field :pages

    field :slider

    field :appartment_icons

    field :appartment_images

  end
end
