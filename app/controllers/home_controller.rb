class HomeController < ApplicationController
  def index
    str = css_svg('static_images/all/Launguage-EN color.svg')
    base64 = Base64.encode64( str )
    result = base64
    #render inline: result #str.delete("\n")
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
