class PagesController < ApplicationController
  def index
  	@newsitem = Newsitem.last
  	@lat = 51.577198
  	@lon = 0.603444
  end

  def about
  end

  def location
    @lat = 51.577198
    @lon = 0.603444
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
end
