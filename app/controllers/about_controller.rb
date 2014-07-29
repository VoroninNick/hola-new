class AboutController < ApplicationController
  def index
    @about_page_blocks = Pages::AboutPage.first.page
  end
end
