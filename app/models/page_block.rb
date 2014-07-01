class PageBlock < ActiveRecord::Base
  has_many :page_block_links, as: :page_block
  has_many :pages, through: :page_block_links, source: :page, source_type: 'Page'

  attr_accessible :pages
end