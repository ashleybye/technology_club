class InterestedPartiesController < ApplicationController
  def new
    @interested_party = InterestedParty.new
  end

  def create
    @interested_party = InterestedParty.new(interested_party_params)
    if @interested_party.valid?
      if ContactUsMailer.interested_party_message(@interested_party).deliver
        flash[:success] = "Thank you for your message, we will be in touch when we have availability."
        redirect_to root_path
      else
        flash.now[:warning] = "Oops! Something went wrong sending your message. Please try again later."
        render :new
      end
    else
      flash.now[:alert] = "Oops! Please try again."
      render :new
    end
  end

  private

    def interested_party_params
      params.require(:interested_party).permit(
        :parent_title, :parent_firstname, :parent_lastname, :parent_email, :parent_relationship,
        :child_firstname, :child_lastname, :child_dob, :child_gender, :session_time,
        :comments
      )
    end
end
