class PathTemplate < ActiveRecord::Base
  has_many :pages
  attr_accessible :pages, :page_ids

  attr_accessible :name, :template
end
