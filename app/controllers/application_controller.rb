class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
		case resource
		when Admin
			admin_members_path
		when Member
			 member_posts_path
		end
	end


	def configure_permitted_parameters
  		devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :user_name, :image, :introduction ])
  		devise_parameter_sanitizer.permit(:account_update, keys: [:user_name, :image, :introduction ])
	end
end
