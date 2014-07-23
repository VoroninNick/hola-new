class Article < ActiveRecord::Base
  acts_as_taggable
  attr_accessible :tag_list

  acts_as_page_block


  attr_accessible :publish, :title, :avatar, :short_description, :release_date, :content, :article_type



  translates :title, :short_description, :content
  accepts_nested_attributes_for :translations
  attr_accessible :translations_attributes, :translations

  class Translation
    attr_accessible :locale, :title, :short_description, :content
  end


  mount_uploader :avatar, ArticleAvatarUploader
  attr_accessible :remove_avatar, :avatar_cache


  before_save :check_page

  def check_page
    if self.article_type.nil? || self.article_type.length == 0 || !['article', 'news'].include?(self.article_type)
      self.article_type = 'article'
    end

    if pages.count == 0
      p = Page.new
      p.controller ||= 'articles'
      p.action ||= 'item'
      p.layout ||= 'application'
      p.save
      pages.push p
    end

    p = page
    self.translations_by_locale.keys.each do |locale|
      if self.name.nil? || self.name.length == 0
        self.name = "#{self.article_type}-#{id}"
      end

      if !p.translations_by_locale.keys.include?(locale) || ( p.path.nil? || p.path.length == 0 )
        p.translations_by_locale[locale].path = "/#{locale.to_s}/appartments/#{self.name.parameterize}"
        p.save
      end

      I18n.with_locale locale do
        # if p.path.nil? || p.path.length == 0
        #   p.path = "/#{locale.to_s}/appartments/#{self.name.parameterize}"
        # end


      end
    end

    p.save
  end


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

      field :translations, :globalize_tabs do
        label "Переклад"
      end
    end
  end
end
