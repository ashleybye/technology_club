class NewsitemsController < ApplicationController
  def index
  	@newsitems = Newsitem.all.order(created_at: :desc)
  end

  def show
  	@newsitem = Newsitem.find(params[:id])
  end
end
