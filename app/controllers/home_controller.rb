class HomeController < ApplicationController
  def index
    @country_name = CountryName.find(rand(CountryName.count) + 1)
    @medias = Instagram.tag_recent_media(URI.encode(@country_name.en), :count => 18)
    respond_to do |format|
      format.html
      format.js
    end
  end
end

