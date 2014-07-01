class PageBlockLink < ActiveRecord::Base
  belongs_to :page, polymorphic: true
  belongs_to :page_block, polymorphic: true
end
