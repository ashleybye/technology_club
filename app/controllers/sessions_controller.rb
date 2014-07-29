class SessionsController < UserAccessController
	
	skip_before_action :require_signin, only: [:new, :create]

	def new
		@session = Session.new
	end

	def create
		@session = Session.new(session_params)
		if @session.valid?
			if user = User.authenticate(params[:session][:email].downcase, params[:session][:password])
				session[:user_id] = user.id
				flash[:success] = "Welcome back, #{user.firstname}"
				redirect_to session[:intended_url] || user_path(user)
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

	def destroy
		session[:user_id] = nil
		flash[:notice] = "You are now logged out!"
		redirect_to root_path
	end

	private

		def session_params
			params.require(:session).permit(:email, :password)
		end

end