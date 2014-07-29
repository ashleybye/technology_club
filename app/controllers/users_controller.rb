class UsersController < UserAccessController

	skip_before_action :require_signin, only: [:new, :create]
	before_action :require_correct_user, only: [:edit, :update, :destroy]

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
  	if @user.save
  		session[:user_id] = @user.id
  		flash[:success] = "User added successfully."
  		redirect_to user_path(@user)
  	else
  		flash.now[:alert] = "Oops! Something went wrong. Please try again."
  		render :new
  	end
	end

	def edit
		# @user assigned in before_action :require_correct_user
	end

	def update
		# @user assigned in before_action :require_correct_user
		if @user.update(user_params)
			flash[:success] = "Accound details successfully updated."
			redirect_to @user
		else
			flash.now[:alert] = "Oops! It looks like something went wrong. Please try again."
			render :edit
		end
	end

	def destroy
		# @user assigned in before_action :require_correct_user
		# do not allow admins to destroy their accounts this way - admin console only
		if @user.admin?
			flash[:notice] = "You cannot delete your account. Please ask another admin to delete it or remove your privilages first."
			redirect_to user_path(@user)
		else
			if @user.destroy
				session[:user_id] = nil
				@current_user = nil
				flash[:notice] = "Account successfully removed. Sorry to see you go, #{@user.firstname}."
				redirect_to root_path
			else
				flash.now[:alert] = "Oh! Something went wrong and we couldn't delete your account just now."
				redirect_to user_path(@user)
			end
		end
	end

	private

		def user_params
			params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
		end
end