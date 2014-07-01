class Article < ActiveRecord::Base
  acts_as_taggable
  attr_accessible :tag_list
  attr_accessible :title, :content


  rails_admin do
    edit do
      field :title, :enum do
        enum do
          ['1', '2', '3']
        end
      end
      field :content
      field :tag_list
    end
  end
end
