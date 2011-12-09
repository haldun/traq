class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
    @current_user ||= begin
      User.fetch_by_auth_token(cookies.signed[:auth_token])
    end if cookies[:auth_token]
  end
  helper_method :current_user

  def authenticate_user!
    if current_user.nil?
      redirect_to login_url
    end
  end

  def admin_required!
    unless current_user && current_user.admin?
      redirect_to root_url
    end
  end
end
