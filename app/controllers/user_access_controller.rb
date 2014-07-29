class UserAccessController < ApplicationController

	before_action :require_signin

	private

		def require_signin
			unless current_user
				session[:intended_url] = request.url
				redirect_to signin_path
			end
		end
		helper_method :require_signin

		def require_correct_user
			@user = User.find(params[:id])
			redirect_to root_path unless current_user?(@user)
		end
		helper_method :require_correct_user

end