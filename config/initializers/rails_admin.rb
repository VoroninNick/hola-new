RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
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

  config.included_models = [ Appartment,  SitemapRecord, Pages::HomePage, HomeSlider, AppartmentSlider ]

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

  [Image, Appartment, AppartmentCategory, AppartmentIcon, AppartmentImage, Page, Metadata, Region, HomeSlide, AppartmentSlide].each do |model|
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
end
