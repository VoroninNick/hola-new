class HomeController < ApplicationController
  def index
    str = css_svg('static_images/all/language-en-color.svg')
    base64 = Base64.encode64( str )
    result = base64
    #render inline: result #str.delete("\n")

    @recommended_appartments = Appartment.recommended.limit(3)
    @available_appartments = Appartment.available
    @home_slider = Pages::HomePage.first.slider

    @appartment_categories = AppartmentCategory.all
    @appartment_regions = Region.all

    @appartment_markers = []

    Appartment.available.each do |appartment|
      m = {lat: appartment.lat, lng: appartment.lng, title: appartment.name, icon_type: 'available'}
      @appartment_markers.push m
    end

    render layout: 'application'

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
