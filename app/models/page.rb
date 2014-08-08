class Page < ActiveRecord::Base
  # has_many :books, :through => :taggings, :source => :taggable, :source_type => "Book"

  # has_many :articles, :through => :taggings, :source => :taggable, :source_type => "Article"

  # has_many :taggings

  # book

  belongs_to :path_template
  attr_accessible :path_template, :path_template_id

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

    rails_admin do
      edit do
        include_all_fields

        field :locale, :hidden
        field :globalized_model do
          hide
        end

        field :path do
          show
          label "path"
        end

        field :data do
          label "data"
          hide
        end
      end

      nested do
        field :path
      end
    end
  end





  rails_admin do

    configure :name do

    end

    configure :controller, :hidden do
    end

    configure :action, :hidden do
      hide
    end

    configure :layout, :hidden do
      hide
    end

    configure :appartments, :hidden do
      hide
    end

    configure :custom_page, :hidden do
      hide
    end

    configure :metadata do

    end

    configure :sitemap_record do

    end

    edit do
      field :name

      field :path_template

      field :translations, :globalize_tabs do

      end


    end

    nested do

      field :name
      field :path_template
      field :translations, :globalize_tabs
    end

    list do
      field :name
      field :path
      field :custom_page
    end
  end


end