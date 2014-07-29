class AboutController < ApplicationController
  def index
    @about_page_blocks = Pages::AboutPage.first.about_page_blocks
  end
end
