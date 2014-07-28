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

  def join
  end

  def privacy
  end

  def cookie
  end
end
