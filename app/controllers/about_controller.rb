class AboutController < ApplicationController
  def index
    @about = About.last
  end

end
