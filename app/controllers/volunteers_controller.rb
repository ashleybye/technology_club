class VolunteersController < ApplicationController
  def new
    @volunteer = Volunteer.new
  end

  def create
    @volunteer = Volunteer.new(volunteer_params)
    if @volunteer.save
      if ContactUsMailer.volunteer(@volunteer).deliver
        flash[:success] = "Thank you for your volunteering, we will be in touch shortly."
        redirect_to root_path
      else
        flash.now[:warning] = "Oops! Something went wrong sending your query. Please try again later."
        render :new
      end
    else
      flash.now[:alert] = "Oops! Something went wrong. Please try again."
      render :new
    end
  end

  private

    def volunteer_params
      params.require(:volunteer).permit(:firstname, :lastname, :email, :phone_no, :why, :experience, :comments)
    end
end
