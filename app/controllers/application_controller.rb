class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production? 
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  private
  def production?
    Rails.env.production?
  end
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :birthday, :first_name, :last_name, :first_name_kana, :last_name_kana, :phone_number, :postcode, :prefecture, :city, :block, :wallet])
  end

def set_parents
  @parents = Category.where(ancestry: nil)
end

end