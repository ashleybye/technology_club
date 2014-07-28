class Admin::NewsitemsController < Admin::AdminController
	def index
		@newsitems = Newsitem.all.order(created_at: :desc)
	end

	def show
		@newsitem = Newsitem.find(params[:id])
	end

	def new
		@newsitem = Newsitem.new
	end

	def create
		@newsitem = Newsitem.new(newsitem_params)
		if @newsitem.save
			flash[:success] = "New news item successfully created."
			redirect_to admin_newsitems_path
		else
			flash.now[:alert] = "Oops! Something went wrong. Please try again."
			render :new
		end
	end

	def edit
		@newsitem = Newsitem.find(params[:id])
	end

	def update
		@newsitem = Newsitem.find(params[:id])
		if @newsitem.update(newsitem_params)
			flash[:success] = "News item successfully updated."
			redirect_to admin_newsitems_path
		else
			flash.now[:alert] = "Oops! Something went wrong. Please try again."
			render :edit
		end
	end

	def destroy
		@newsitem = Newsitem.find(params[:id])
		if @newsitem && @newsitem.destroy
			flash[:notice] = "News item successfully deleted."
			redirect_to admin_newsitems_path
		else
			flash.now[:alert] = "Oops! Something went wrong. Please try again."
		end
	end

	private

		def newsitem_params
			params.require(:newsitem).permit(:title, :content)
		end

end