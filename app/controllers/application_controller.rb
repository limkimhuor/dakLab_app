class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

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
end
