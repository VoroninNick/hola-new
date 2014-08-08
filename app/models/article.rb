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

    rails_admin do
      edit do
        field :locale, :hidden
        field :title
        field :short_description
        field :content, :ck_editor
      end
    end
  end


  mount_uploader :avatar, ArticleAvatarUploader
  attr_accessible :remove_avatar, :avatar_cache


  before_save :check_page

  after_save :check_page

  def check_page
    if pages.count == 0
      p = Page.new
      p.action ||= 'item'
      p.layout ||= 'application'
      p.save
      pages.push p
    end

    p = page
    if self.article_type == 'news'
      p.page.controller = 'news'
    elsif self.article_type == 'articles'
      p.page.controller = 'articles'
    end
    self.translations_by_locale.keys.each do |locale|

      if self.title.nil? || self.title.length == 0
        self.title = "#{(self.article_type == 'article')? 'article' : (self.article_type == 'news')? 'news' : ''}-#{id}"
      end



      if !p.translations_by_locale.keys.include?(locale) || ( p.path.nil? || p.path.length == 0 )
        translation = p.translations.new(locale: locale)
        translation.path = "#{self.title.parameterize}"
        #translation.save
        p.translations.push(translation)
        p.save
      end

      I18n.with_locale locale do
        # if p.path.nil? || p.path.length == 0
        #   p.path = "/#{locale.to_s}/appartments/#{self.title.parameterize}"
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

      #field :title

      field :avatar

      field :translations, :globalize_tabs do
        label "Переклад"
      end

      #field :short_description

      #field :content

      #field :tag_list

      field :release_date

      field :pages


    end
  end
end
