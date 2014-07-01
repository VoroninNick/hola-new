class Metadata < ActiveRecord::Base
  belongs_to :page
  attr_accessible :page, :page_id, :head_title, :meta_description

  acts_as_taggable_on :meta_keywords
  attr_accessible :meta_keywords, :meta_keyword_list
  #acts_as_taggable
  #attr_accessible :tag_list

  rails_admin do
    edit do
      field :head_title
      field :meta_description
      field :meta_keyword_list do
        partial 'tag_list_with_suggestions'
      end

      #field :tag_list do
      #  partial 'tag_list_with_suggestions'
      #end
    end
  end
end
