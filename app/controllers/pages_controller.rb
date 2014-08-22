class PagesController < ApplicationController

  LAT = 51.577198
  LON = 0.603444

  def index
  	@newsitem = Newsitem.last
  	@lat = LAT
  	@lon = LON
  end

  def about
  end

  def location
    @lat = LAT
    @lon = LON
  end

  def club_rules
  end

  def privacy
  end

  def cookie
  end

  def cookie_accept
    referring_url = params[:ref]
    accept_cookies_policy
    redirect_to referring_url
  end

  def disclaimer
  end

  def linking
  end
end
