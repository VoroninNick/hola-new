module ApplicationHelper
  #def stub_image(width = 420, height = 350, text = 'item 1', options = {})

    #ActionView::Helpers::AssetTagHelper.image_tag(image_url, options)
    #"<img src='' />".html_safe

  #end

  #spec = Gem::Specification.find_by_name("actionview")
  #gem_root = spec.gem_dir
  #yaml_obj = YAML.load(gem_root + "/file_name.yaml")
  #require "#{gem_root}/lib/action_view/helpers/asset_tag_helper"

  #include ActionView::Helpers::AssetTagHelper
  #ActionView::Helpers::AssetTagHelper.image_tag

  def get_image_orientation(image_version)
    img = Magick::Image.read(image_version.path).first
    orientation = 'horizontal'
    if img.rows > img.columns
      orientation = 'vertical'
    end

    orientation

  end

  def stub_image(width = 420, height = 350, text = 'item 1', options = {})
    image_url = "http://placehold.it/#{width}x#{height}&text=#{text}"
    options[:src] = image_url
    output = "<img "
    options.each_pair do |key, value|
      output += "#{key}='#{value}' "
    end
    output += "/>"
    output.html_safe
  end

  def developed_by
    render partial: 'helpers/vs/developed_by', locals: {  }
  end

  def brand_wrap(title, tag = 'span', link = false)
    #render template: 'helpers/application/brand_wrap'
    render partial: 'helpers/application/brand_wrap', locals: { title: title, tag: tag, link: link }
  end

  def order_button(price, title = 'Замовити!', size = 'medium', link = false, data_modal_id = false, label = false)
    render partial: 'helpers/application/order_button', locals: { price: price, title: title, size: size, link: link, data_modal_id: data_modal_id, label: label }
  end

  def self.js_embedded_svg filename, options={}
    file = File.read(Rails.root.join('app', 'assets', 'images', filename))
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css 'svg'
    if options[:class].present?
      svg['class'] = options[:class]
    end
    source = svg.to_html
    minimized_source = source
    minimized_source = minimized_source.remove("\r")
    minimized_source = minimized_source.remove("\t")
    minimized_source = minimized_source.remove("\n")
    minimized_source
  end

  def embedded_svg_from_assets filename, options = {}
    embedded_svg("/app/assets/images/#{filename}", options)
  end

  def embedded_svg_from_public filename, options = {}
    embedded_svg("/public/#{filename}", options)
  end

  def embedded_svg filename, options={}
    file = File.read(Rails.root.to_s + filename.to_s)
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css 'svg'
    if options[:class].present?
      svg['class'] = options[:class]
    end
    doc.to_html.html_safe
  end

  # def self.css_svg(filename, options={})
  #   file = File.read(Rails.root.join('app', 'assets', 'images', filename))
  #   doc = Nokogiri::HTML::DocumentFragment.parse file
  #   svg = doc.at_css 'svg'
  #   if options[:class].present?
  #     svg['class'] = options[:class]
  #   end
  #   #doc.to_html.
  #   svg.to_s
  # end

  def self.css_svg(filename, options={})
    file = File.read(Rails.root.join('app', 'assets', 'images', filename))
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css 'svg'
    if options[:class].present?
      svg['class'] = options[:class]
    end
    #doc.to_html.
    svg.to_s
  end

  def trim(num)
    i, f = num.to_i, num.to_f
    i == f ? i : f
  end

  def price_to_currency_string(price)
    ApplicationHelper.self_price_to_currency_string(price)
  end

  def self.self_price_to_currency_string(price)


    require 'money'
    require 'money/bank/google_currency'

    Money.default_bank = Money::Bank::GoogleCurrency.new

    usd = Money.new(price, :usd)
    #usd2 = price.to_money(:usd)
    converted_price = usd

    output_string = "#{converted_price.fractional} $"

    locale = I18n.locale

    if locale == :ru
      converted_price = usd.exchange_to(:RUB)
      output_string = "#{converted_price.fractional} р."
    elsif locale == :uk
      converted_price = usd.exchange_to(:UAH)
      output_string = "#{converted_price.fractional} грн."
    elsif locale == :pl
      converted_price = usd.exchange_to(:PLN)
      output_string = "#{converted_price.fractional} zl."
    end

    output_string
  end

  def page
    if params[:controller].index('devise').nil?
      if params[:source_route] != true
        Page.find(params[:page_id])
      end
    end
  end

  def page_type
    if params[:controller].index('devise') != nil
      :devise_route

    elsif params[:source_route] != true
      :db_page
    else
      :source_route
    end
  end
end



