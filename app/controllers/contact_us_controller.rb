class ContactUsController < ApplicationController
  def new
  	@message = Message.new
  end

	def create
		@message = Message.new(message_params)
		if @message.valid?
			if ContactUsMailer.contact_us_query(@message).deliver
				flash[:success] = "Thank you for your message, we will be in touch shortly."
				redirect_to root_path
			else
				flash.now[:warning] = "Oops! Something went wrong sending your query. Please try again later."
				render 'new'
			end
		else
			flash.now[:alert] = "Oops! You have not filled out the form correctly. Please try again."
			render 'new'
		end
	end

  private

  	def message_params
  		params.require(:message).permit(:name, :email, :comment)
  	end

end
