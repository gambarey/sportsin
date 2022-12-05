class ApplicationController < ActionController::Base
  # [...]
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:first_name, :last_name, :position, :role, :sport_id, :photo, :description])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :position, :role, :sport_id, :photo, :description])
  end

  protected

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
