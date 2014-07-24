class ContactController < ApplicationController
  def show
    @available_appartments = Appartment.available

    @appartment_markers = []

    @available_appartments.each do |appartment|
      m = {lat: appartment.lat, lng: appartment.lng, category: appartment.appartment_category.name, price: ApplicationHelper.self_price_to_currency_string(appartment.price), address: appartment.address}
      @appartment_markers.push m
    end
  end

  def create
  end
end
