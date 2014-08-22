class Admin::UsersController < Admin::AdminController
  def index
  	@users = User.all.order(firstname: :asc)
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(admin_user_params)
  	if @user.save
  		flash[:success] = "User added successfully."
  		redirect_to admin_users_path
  	else
  		flash.now[:danger] = "Oops! Something went wrong. Please try again."
  		render :new
  	end
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(admin_user_params)
  		flash[:success] = "User updated successfully."
  		redirect_to admin_users_path
  	else
  		flash.now[:danger] = "Oops! Something went wrong."
  		render :edit
  	end
  end

  def destroy
  	@user = User.find(params[:id])
  	if current_user?(@user)
  		flash[:danger] = "You cannot delete yourself!"
	  else
	  	if @user && @user.destroy
	  		flash[:success] = "User removed."
		  else
		  	flash[:danger] = "Oops! Something went wrong."
		  end
		end
  	redirect_to admin_users_path
  end

  private

  	def admin_user_params
  		params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation, :admin)
  	end
end
