class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :authenticate

  def after_sign_in_path_for resource
    redirect_url resource
  end

  def redirect_url resource
    case
    when resource.is_a?(Admin)
      manager_authenticated_root_path
    else
      root_path
    end
  end

  def after_sign_out_path_for resource
    resource == :user ? root_path : new_manager_session_path
  end

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["USER_NAME"] && password == ENV["PASSWORD"]
    end
  end
end
