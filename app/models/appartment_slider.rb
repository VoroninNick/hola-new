class AppartmentSlider < ActiveRecord::Base
  #self.table_name = 'sliders'

  belongs_to :sliderable, polymorphic: true, class_name: 'Appartment'
  attr_accessible :sliderable, :sliderable_id, :sliderable_type

  has_many :slides, as: :slider, class_name: 'AppartmentSlide'

  attr_accessible :slides, :name
  #nested :slides
  accepts_nested_attributes_for :slides
  attr_accessible :slides_attributes


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