class HomeController < ApplicationController
  def index
    @country_name = CountryName.find(rand(CountryName.count))
    @medias = Instagram.tag_recent_media(URI.encode(@country_name.en), :count => 18)
  end
end

