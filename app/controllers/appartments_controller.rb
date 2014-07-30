class AppartmentsController < ApplicationController
  def list
    @available_appartments = Appartment.available

    @appartment_markers = []

    @appartment_categories = AppartmentCategory.all
    @appartment_regions = Region.all

    @available_appartments.each do |appartment|
      m = {lat: appartment.lat, lng: appartment.lng, category: appartment.appartment_category.name, price: ApplicationHelper.self_price_to_currency_string(appartment.price), address: appartment.address}
      @appartment_markers.push m
    end


  end

  def item
    #item_url = params[:item]
    page = Page.find(params[:page_id])

    if page.appartments.count == 1
      @appartment = page.appartments.first

      @available_appartments = Appartment.available

      @recently_viewed_appartments = []

      @appartment_icons = @appartment.appartment_icons

      @appartment_images = @appartment.appartment_images

      @appartment_slider = @appartment.slider

      @appartment_markers = [{lat: @appartment.lat, lng: @appartment.lng, title: @appartment.name, category: @appartment.appartment_category.name, price: ApplicationHelper.self_price_to_currency_string(@appartment.price), address: @appartment.address}]

    end
  end

  def search
    render inline: "#{params.inspect} <br/>query_params_count: #{params[:query].split('/').inspect}"
  end
end
