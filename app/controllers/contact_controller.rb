class ContactController < ApplicationController
  def show
    @available_appartments = Appartment.available

    @appartment_markers = Appartment.get_markers(@available_appartments)
  end

  def create
  end
end
