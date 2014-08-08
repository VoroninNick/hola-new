#encoding: utf-8

Rails.configuration.to_prepare do
  #require '../../app/helpers/rails_admin/application_helper_patch'
  #require "#{RailsRoot}/lib/rails_admin/config_patch"
  require File.expand_path('../../../lib/rails_admin/config_patch', __FILE__)

  RailsAdmin::Config.send     :include, RailsAdmin::ConfigPatch
  RailsAdmin::ApplicationHelper.send     :include, RailsAdmin::ApplicationHelperPatch

end

#I18n.locale = :uk

RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new

    # multiple_upload do
    #   #only Album
    # end
    #
    # my_action do
    #   only Album
    # end

    export
    bulk_delete
    show
    edit
    delete
    show_in_app



    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.included_models = [ SitemapRecord, Pages::HomePage, HomeSlider, AppartmentSlider, Menu, Pages::AboutPage, Configuration, Setting, PathTemplate ]

  [Appartment, Region, AboutPageBlock, Page, AppartmentIcon, AppartmentImage, AppartmentSlide, AppartmentCategory].each do |model|
    config.included_models += [model, model::Translation]
  end

  # add translatable pages
  [Article, Dictionary, MenuItem].each do |model|
    config.included_models += [model, model::Translation]

    config.model model::Translation do
      nested do
        include_all_fields


        field :locale do
          html_attributes  readonly: "readonly"
        end

        field :globalized_model do
          hide
        end
      end
    end
  end

  # [Image::Translation, AppartmentCategory::Translation, AppartmentIcon::Translation, AppartmentImage::Translation, Metadata::Translation, Slide::Translation, Region::Translation].each do |model|
  #   config.model model do
  #      nested do
  #        configure :locale do
  #          html_attributes  readonly: "readonly"
  #        end
  #
  #        configure :globalized_model do
  #          hide
  #        end
  #      end
  #   end
  # end

  [Image, Metadata, HomeSlide].each do |model|
    config.model model do
      edit do
        include_all_fields
        field :translations, :globalize_tabs do
          show
        end
      end
    end

    config.included_models += [model, model::Translation]

    config.model model::Translation do
      nested do
        include_all_fields


        field :locale do
          html_attributes  readonly: "readonly"
        end

        field :globalized_model do
          hide
        end
      end
    end
  end

  root = Tree::TreeNode.new('navigation_static_tree')


  config.navigation_static_links = root
  root << Tree::TreeNode.new('appartments', title: 'Квартири')
  root << Tree::TreeNode.new('gallery', title: 'Галерея')
  root << Tree::TreeNode.new('sliders', title: 'Слайдери')
  root << Tree::TreeNode.new('articles', title: 'Публікації')
  root << Tree::TreeNode.new('pages', title: 'Сторінки')
  root << Tree::TreeNode.new('navigation', title: 'Навігація')




  appartments = root['appartments']
  appartments << Tree::TreeNode.new( 'Всі квартири', { link: '/admin/appartment' } )
  appartments << Tree::TreeNode.new('Іконки', { link: '/admin/appartment_icon' } )
  appartments << Tree::TreeNode.new('Райони', { link: '/admin/region' } )
  appartments << Tree::TreeNode.new('Категорії', { link: '/admin/appartment_category' } )

  gallery = root['gallery']
  gallery << Tree::TreeNode.new('all', { title: 'Галереї квартир', link: '/admin/appartment_image' } )

  sliders = root['sliders']
  sliders << Tree::TreeNode.new('home_sliders', { title: 'Для головної', link: '/admin/home_slider' } )
  sliders << Tree::TreeNode.new('appartment_sliders', { title: 'Для квартир', link: '/admin/appartment_slider' } )


  pages = root['pages']
  pages << Tree::TreeNode.new('all', { title: 'Всі', link: '/admin/page' } )
  pages << Tree::TreeNode.new('home_page', { title: 'Головна', link: '/admin/pages~home_page/1' } )
  pages << Tree::TreeNode.new('about_page', { title: 'Про нас', link: '/admin/pages~about_page/1' } )


  articles = root['articles']
  articles << Tree::TreeNode.new('all', { title: 'Всі статті', link: '/admin/article' } )
  #articles << Tree::TreeNode.new('useful_articles', title: 'Корисні статті')
  #useful_articles = articles['useful_articles']
  #useful_articles << Tree::TreeNode.new('all', { title: 'Всі', link: "/admin/article?source_route=true&utf8=✓&query=article" } )

  #articles << Tree::TreeNode.new('news', title: 'Новини')
  #news = articles['news']
  #news << Tree::TreeNode.new('all', { title: 'Всі', link: "/admin/article?source_route=true&utf8=✓&query=article" } )

  navigation = root['navigation']
  navigation << Tree::TreeNode.new('menu', { title: 'Меню', link: '/admin/menu' } )









end
