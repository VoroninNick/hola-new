module ApplicationHelper


  def stub_image(width = 420, height = 350, text = 'item 1')
    "<img src='http://placehold.it/#{width}x#{height}&text=#{text}' />".html_safe
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
    source = doc.to_html.html_safe
    minimized_source = source
    minimized_source = minimized_source.remove("\r")
    minimized_source = minimized_source.remove("\t")
    minimized_source = minimized_source.remove("\n")
    minimized_source
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

  def trim(num)
    i, f = num.to_i, num.to_f
    i == f ? i : f
  end
end
