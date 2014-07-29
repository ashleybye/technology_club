class Admin::SessionsController < Admin::AdminController
	
	skip_before_action :require_admin_signin, only: [:new, :create]

	def new
		# If already looged in, don't be here, go to the dashboard
		redirect_to admin_dashboard_path if current_user.admin?
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
				flash.now[:alert] = "Uh oh! We don't recognise that email/password combination. Please try again."
				render 'new'
			end
		else
			flash.now[:alert] = "Uh oh! There was some kind of problem. Take a look below and try again."
			render 'new'
		end
	end

	private

		def session_params
			params.require(:session).permit(:email, :password)
		end

end