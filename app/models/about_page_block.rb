class AboutPageBlock < ActiveRecord::Base
  belongs_to :pages_about_page

  attr_accessible :content, :image, :alt, :title#, :description

  mount_uploader :image, AboutBlockImageUploader

  translates :content, :alt, :title



  rails_admin do

    field :content
    field :image
    field :alt
    field :title

  end
end
