class Pages::HomePage < ActiveRecord::Base
  #has_many :page_block_links, as: :page
  #has_many :page_blocks, through: :page_block_links, source: :page_block, source_type: 'PageBlock'

  has_one :page, as: :custom_page
  attr_accessible :page
  accepts_nested_attributes_for :page
  attr_accessible :page_attributes

  has_one :slider, class_name: 'HomeSlider', as: :sliderable

  attr_accessible :slider

  accepts_nested_attributes_for :slider
  attr_accessible :slider_attributes

  rails_admin do
    edit do
      field :slider
      field :page do
      end
    end
  end
end
