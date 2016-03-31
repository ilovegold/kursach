class StaticPagesController < ApplicationController
  def home
  	if user_signed_in?
  		redirect_to users_profile_path
  	end
  end

  def help
  end

  

  def contact
  end
end
