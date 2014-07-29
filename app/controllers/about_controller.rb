class AboutController < ApplicationController
  def index
    @about_page_blocks = Pages::AboutPage.first.page.about_page_blocks
  end
end
