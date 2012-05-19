class ApplicationController < ActionController::Base
  protect_from_forgery

  def main
	
    # bairros -> 0, 1, 2, 3, 4, 5
		@neighborhoods = Studio::NEIGHBORHOODS
		@user = User.new
    @studios_types = Studio::STUDIO_TYPES
    @user.studios.build
		#render :layout => false
  end

  def check_login
    unless User.find_by_id(session[:user_id])
      redirect_to root_path, :error => "Por favor, faca login"
    end
  end

end
