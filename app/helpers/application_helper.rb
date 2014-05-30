module ApplicationHelper
  def brand_wrap(title, tag = 'span', link = false)
    #render template: 'helpers/application/brand_wrap'
    render partial: 'helpers/application/brand_wrap', locals: { title: title, tag: tag, link: link }
  end

  def embedded_svg filename, options={}
    file = File.read(Rails.root.join('app', 'assets', 'images', filename))
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
end
