class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :cookies_policy

  private

    # Constant to store when cookie policy altered in human and linux timestamp form
    COOKIES_POLICY_ALTERED_TIME = '1 August 2014 22:00:00'
    COOKIES_POLICY_ALTERED_ON = Time.parse(COOKIES_POLICY_ALTERED_TIME).strftime('%s').to_i

	  def current_user
			@current_user ||= User.find(session[:user_id]) if session[:user_id]
		end
		helper_method :current_user

		def current_user?(user)
			current_user == user
		end
		helper_method :current_user?

		def current_user=(user)
			@current_user = user
		end

		def signed_in?
			!current_user.nil?
		end
		helper_method :signed_in?

    def age(date)
      age = Date.today.year - date.year
      age - 1 if (Date.today.month <= date.month) && (Date.today.day < date.day)
    end
    helper_method :age

    def cookies_policy
      unless visitor_has_accepted_cookies_policy?
        flash.now[:secondary] = %Q[This site uses cookies. Please read our <a href="/cookies_policy">Cookies
          Policy</a>. Click to <a href="/accept_cookies_policy?ref=#{request.url}" class="no-close-cookies-policy">accept</a>
          the terms of our policy.]
      end
    end

    # Compares whether timestamp stored in cookie is greater than or equal to when policy last changed.
    # If true, visitor has accepted latest policy.
    def visitor_has_accepted_cookies_policy?
      puts cookies[:cookies_policy_accepted_on]
      cookies[:cookies_policy_accepted_on].to_i >= COOKIES_POLICY_ALTERED_ON if cookies[:cookies_policy_accepted_on]
    end
    helper_method :visitor_has_accepted_cookies_policy?

    def accept_cookies_policy
      cookies.permanent[:cookies_policy_accepted_on] = Time.now.strftime('%s').to_i
    end

end
