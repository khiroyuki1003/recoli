class ApplicationController < ActionController::Base
  before_action :user_data_permit, if: :devise_controller?


  private
  def user_data_permit
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :birth_date, :precious_word])
  end
end
