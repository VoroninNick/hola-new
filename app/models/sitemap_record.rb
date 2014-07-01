class SitemapRecord < ActiveRecord::Base
  belongs_to :page
  attr_accessible :page, :page_id
  attr_accessible :displayed_on_sitemap, :location, :path, :last_modified, :change_frequency, :priority


  #acts_as_taggable
  #attr_accessible :tag_list

  rails_admin do
    edit do

      field :displayed_on_sitemap
      field :path
      field :location
      field :last_modified
      field :change_frequency, :enum do
        enum do
          [ 'always', 'hourly', 'daily', 'weekly', 'monthly', 'yearly']
        end
      end
      field :priority

      #field :tag_list do
      #  partial 'tag_list_with_suggestions'
      #end
    end
  end
end
