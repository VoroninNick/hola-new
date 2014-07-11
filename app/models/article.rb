class Article < ActiveRecord::Base
  acts_as_taggable
  attr_accessible :tag_list


  attr_accessible :publish, :title, :avatar, :short_description, :release_date, :content, :article_type



  translates :title, :short_description, :content
  accepts_nested_attributes_for :translations
  attr_accessible :translations_attributes, :translations

  class Translation
    attr_accessible :locale, :title, :short_description, :content
  end


  mount_uploader :avatar, ArticleAvatarUploader
  attr_accessible :remove_avatar, :avatar_cache


  rails_admin do
    list do
      field :id
      field :article_type
      field :publish
      field :title
      field :avatar
      field :short_description
    end

    edit do
      field :publish

      field :article_type, :enum do
        enum do
          ['article', 'news']
        end
      end

      field :title

      field :avatar

      field :short_description

      field :content

      #field :tag_list

      field :release_date
    end
  end
end
