class DynamicRouter
  def self.load
    Hola::Application.routes.draw do
      Page.all.each do |page|
        #puts "Routing #{pg.name}"
        to = 'pages#show'
        if (page.controller && page.controller.length > 0) && (page.action && page.action.length > 0)
          to = "#{page.controller}##{page.action}"
        end

        page.translations_by_locale.keys.each do |locale|
          I18n.with_locale locale do
            get page.path, :to => to, defaults: { page_id: page.id, locale: locale }
          end
        end

      end
    end

    if Configuration.settings_hash["detect_locale_automatically"] == 'true'

    end
  end

  def self.reload
    Hola::Application.routes_reloader.reload!
  end
end