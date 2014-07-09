class Page < ActiveRecord::Base
  # has_many :books, :through => :taggings, :source => :taggable, :source_type => "Book"

  # has_many :articles, :through => :taggings, :source => :taggable, :source_type => "Article"

  # has_many :taggings

  # book

  attr_accessible :name
  attr_accessible :path
  attr_accessible :data
  attr_accessible :controller
  attr_accessible :action
  attr_accessible :layout

  belongs_to :custom_page, polymorphic: true



  has_many :page_block_links, as: :page
  has_many :page_blocks, through: :page_block_links, source: :page_block, source_type: 'PageBlock'
  has_many :appartments, through: :page_block_links, source: :page_block, source_type: 'Appartment'

  has_one :metadata
  accepts_nested_attributes_for :metadata
  attr_accessible :metadata, :metadata_attributes

  has_one :sitemap_record
  accepts_nested_attributes_for :sitemap_record
  attr_accessible :sitemap_record, :sitemap_record_attributes



  attr_accessible :custom_page, :custom_page_id, :custom_page_type, :appartment_ids


  after_save :reload_routes

  def reload_routes
    DynamicRouter.reload
  end

  translates :path, :data
  accepts_nested_attributes_for :translations
  attr_accessible :translations_attributes, :translations

  class Translation
    attr_accessible :locale, :path, :data
  end





  rails_admin do
    nested do

      field :name do
        hide
      end

      field :path
      field :data
      field :controller
      field :action
      field :layout
      field :metadata
      field :sitemap_record

    end
  end


end