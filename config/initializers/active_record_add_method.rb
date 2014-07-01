def acts_as_page_block
  has_many :page_block_links, as: :page_block
  has_many :pages, through: :page_block_links, source: :page, source_type: 'Page'
  attr_accessible :pages

  accepts_nested_attributes_for :pages
  attr_accessible :pages_attributes
end

#def nested(attr)
#  accepts_nested_attributes_for attr
#  attr_accessible :"#{attr.to_s}_attributes"
#end

def has_slider
  has_one :slider, as: :sliderable
  attr_accessible :slider
end