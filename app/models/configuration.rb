class Configuration < ActiveRecord::Base
  has_many :settings
  accepts_nested_attributes_for :settings
  attr_accessible :settings_attributes, :settings

  rails_admin do
    edit do
      field :settings
    end
  end
end
