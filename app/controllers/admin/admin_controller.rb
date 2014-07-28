class Admin::AdminController < ApplicationController
	layout 'admin/layouts/admin_site'

	before_action :require_admin_signin

	private

		def require_admin_signin
			unless current_user
				session[:intended_url] = request.url
				redirect_to admin_root_path
			else
				unless current_user.admin?
					redirect_to root_path
				end
			end
		end
		helper_method :require_admin_signin

end