class UsersController < ApplicationController
	before_action :user_signed_in?, only: [:show]


  def profile
    if not user_signed_in?
      redirect_to login_path
      return
    end
  	if current_user.avatar.nil?
  		current_user.avatar = ""
  	end

  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    redirect_to edit_user_registration_path
  end

  def index
    @users = User.paginate(page: params[:page], :per_page => 5)
  end

end
