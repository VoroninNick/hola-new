class Slider < ActiveRecord::Base
  belongs_to :sliderable, polymorphic: true
  attr_accessible :sliderable, :sliderable_id, :sliderable_type
  has_many :slides
  attr_accessible :slides
  #nested :slides
  accepts_nested_attributes_for :slides
  attr_accessible :slide_attributes


  rails_admin do
    edit do
      field :name
      field :slides
      field :sliderable
    end
  end

end
