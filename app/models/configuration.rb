class Configuration < ActiveRecord::Base
  has_many :settings
  accepts_nested_attributes_for :settings
  attr_accessible :settings_attributes, :settings

  def self.active
    Configuration.first
  end

  def self.settings_hash
    s = self.active.settings
    res = {}
    if s.nil?
      res = {}
    elsif s.respond_to?(:each)
      s.each do |setting|
        res[setting.name] = setting.value
      end
    end

    res
  end

  rails_admin do
    edit do
      field :settings
    end
  end
end
