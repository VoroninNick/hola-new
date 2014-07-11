class AppartmentsController < ApplicationController
  def list
    @available_appartments = Appartment.where("available = 't' AND publish = 't' ").order('id desc')
  end

  def item
    #item_url = params[:item]
    page = Page.find(params[:page_id])

    if page.appartments.count == 1
      @appartment = page.appartments.first

      @available_appartments = Appartment.where("available = 't' AND publish = 't' AND id <> #{@appartment.id}").order('id desc')

      @recently_viewed_appartments = []

      @appartment_icons = @appartment.appartment_icons

      @appartment_images = @appartment.appartment_images

      @appartment_slider = @appartment.slider

      @appartment_markers = [{lat: @appartment.lat, lng: @appartment.lng, title: @appartment.name, icon_type: 'available'}]

    end
  end
end
