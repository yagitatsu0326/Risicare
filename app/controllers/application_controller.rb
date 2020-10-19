class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?


	def configure_permitted_parameters
  		devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :user_name, :image, :introduction ])
  		devise_parameter_sanitizer.permit(:account_update, keys: [:user_name, :image, :introduction ])
	end
end
