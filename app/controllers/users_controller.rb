class UsersController < ApplicationController
		
  def profile
  	if current_user.avatar.nil?
  		current_user.avatar = ""
  	end

  	@b = current_user.books
  end

  def show
  	@user = User.find(params[:id])
  end
end
