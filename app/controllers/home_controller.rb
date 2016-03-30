class HomeController < ApplicationController
  def index
  	if current_user
  		@user = current_user
  	else
  		redirect_to log_in_path
  	end
  end
end
