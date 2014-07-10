class HomeController < ApplicationController
  def index
    str = css_svg('static_images/all/language-en-color.svg')
    base64 = Base64.encode64( str )
    result = base64
    #render inline: result #str.delete("\n")

    @home_recommended = Appartment.where(recommended: 't', publish: 't', available: 't').order('id desc').limit(3)
    @home_available = Appartment.where(available: 't', publish: 't').order('id desc')
    @home_slider = Pages::HomePage.first.slider

    @appartment_categories = AppartmentCategory.all
    @appartment_regions = Region.all

  end

  def css_svg(filename, options={})
    file = File.read(Rails.root.join('app', 'assets', 'images', filename))
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css 'svg'
    if options[:class].present?
      svg['class'] = options[:class]
    end
    #doc.to_html.
    svg.to_s
  end
end
