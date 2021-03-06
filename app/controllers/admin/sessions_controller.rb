class Admin::SessionsController < Admin::AdminController

	skip_before_action :require_admin_signin, only: [:new, :create, :destroy]
	before_action :redirect_to_dashboard_if_signed_in, only: :new

	def new
		@session = Session.new
	end

	def create
		@session = Session.new(session_params)
		if @session.valid?
			if user = User.authenticate(params[:session][:email].downcase, params[:session][:password])
				session[:user_id] = user.id
				flash[:success] = "Welcome back, #{user.firstname}"
				redirect_to admin_dashboard_path
				session[:intended_url] = nil
			else
				flash.now[:danger] = "Uh oh! We don't recognise that email/password combination. Please try again."
				render 'new'
			end
		else
			flash.now[:danger] = "Uh oh! There was some kind of problem. Take a look below and try again."
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		current_user = nil
		flash[:success] = "You are now logged out."
		redirect_to root_path
	end

	private

		def session_params
			params.require(:session).permit(:email, :password)
		end

		def redirect_to_dashboard_if_signed_in
			redirect_to admin_dashboard_path if current_user && current_user.admin?
		end

end
