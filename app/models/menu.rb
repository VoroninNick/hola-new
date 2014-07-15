class Menu < ActiveRecord::Base
  self.table_name = 'menus'

  attr_accessible :name, :menu_items
  has_many :menu_items

  accepts_nested_attributes_for :menu_items
  attr_accessible :menu_items_attributes

  rails_admin do
    edit do
      field :name
      field :menu_items
    end
  end
end