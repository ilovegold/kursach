class StaticPagesController < ApplicationController
  def home
  	if user_signed_in?
  		redirect_to profile_path
  	end
  end

  def help
  end

  

  def contact
  end

  def index
  	redirect_to root_path
  end

end
