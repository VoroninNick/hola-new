class Slider < ActiveRecord::Base
  belongs_to :sliderable, polymorphic: true
  attr_accessible :sliderable, :sliderable_id, :sliderable_type
  has_many :slides, as: :slider
  attr_accessible :slides
  #nested :slides
  accepts_nested_attributes_for :slides
  attr_accessible :slides_attributes

  attr_accessible :name


  rails_admin do
    edit do
      field :name
      field :slides
      field :sliderable
    end

    nested do
      field :name
      field :slides
      field :sliderable do
        hide
      end
    end
  end

end
