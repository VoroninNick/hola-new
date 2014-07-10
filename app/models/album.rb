class Album < ActiveRecord::Base
  attr_accessible :name
  has_many :photos

  accepts_nested_attributes_for :photos, :allow_destroy => true
  attr_accessible :photos_attributes, :photo_ids, :photos

  rails_admin do
    edit do
      field :name

      field :photos do
        #partial "multiple_upload"
      end
    end
  end
end
