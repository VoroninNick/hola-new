class Setting < ActiveRecord::Base
  belongs_to :configuration
  attr_accessible :name, :value

  rails_admin do
    edit do
      field :name
      field :value
      field :configuration
    end

    nested do
      field :configuration do
        hide
      end
    end
  end
end
