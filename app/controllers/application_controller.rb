class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :conf_permitted_parameters, if: :devise_controller?

  protected

  def conf_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :full_name, :balance, :telephone, :check])
  end
end


