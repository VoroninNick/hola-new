class Region < ActiveRecord::Base
  attr_accessible :name
  has_many :appartments
  attr_accessible :appartments

  rails_admin do
    edit do
      field :name
      field :appartments
    end
  end
end
