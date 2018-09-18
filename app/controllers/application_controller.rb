class ApplicationController < ActionController::Base
	# before_action :authenticate_user!
	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource) 

    user_path(resource)

  	end

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:username,:email])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
		devise_parameter_sanitizer.permit(:account_update, keys: [:username,:profile_intro])
	end

end
