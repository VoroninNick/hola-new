class Dictionary < ActiveRecord::Base
  attr_accessible :name, :content

  translates :content
  accepts_nested_attributes_for :translations
  attr_accessible :translations_attributes, :translations

  class Translation
    attr_accessible :locale, :content
  end

  def get_hash
    hash = YAML.load(self.content, :safe => true)

    hash
  end

  def get_hash_with_locale_and_name
    hash = {}
    hash[I18n.locale.to_s] = { "#{self.name}" => self.get_hash }

    hash
  end

  after_save :save_to_file

  def save_to_file
    dir_path = Rails.root.join('config', 'locales', 'db')
    dirname = dir_path.to_s
    unless File.directory?(dir_path)
      FileUtils.mkdir_p(dirname)
    end

    #unless File.exist?(dirname.join('image.jpg'))
    #end

    self.translations_by_locale.keys.each do |locale|
      I18n.with_locale locale do
        if self.content && self.content.length > 0 && self.get_hash
          File.open(dir_path.join("#{self.name}.#{locale}.yml"), "w") do |f|
            #content = self.content
            hash = get_hash_with_locale_and_name

            f.write(hash.to_yaml)
          end
        end
      end

    end

  end



  def self.get_translation(path)

    hash = self.get_hash
  end

  rails_admin do
    field :name
    field :content

    field :translations, :globalize_tabs
  end
end
