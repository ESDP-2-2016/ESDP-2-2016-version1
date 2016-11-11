class AboutController < ApplicationController
  def index
      if About.exists?
        @about = About.last
      else
        render file: 'public/404', status: 404, formats: [:html]
      end
  end
end
