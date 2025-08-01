# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController

  layout 'admin'
  
  protected

  def after_sign_in_path_for(resource)
    admin_dashboards_path
  end

  def after_sign_out_path_for(resource_or_scope)
    new_admin_session_path
  end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
