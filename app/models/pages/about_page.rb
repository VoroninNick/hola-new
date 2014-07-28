class Pages::AboutPage < ActiveRecord::Base
  has_one :page, as: :custom_page
  attr_accessible :page
  accepts_nested_attributes_for :page
  attr_accessible :page_attributes

  has_many :about_page_blocks
  accepts_nested_attributes_for :about_page_blocks
  attr_accessible :about_page_blocks_attributes, :about_page_blocks



  rails_admin do
    field :about_page_blocks
    field :page
  end
end
