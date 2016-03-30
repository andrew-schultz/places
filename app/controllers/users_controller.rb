class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		session[:user_id] = @user.id
  		redirect_to root_path
  	else
  		redirect_to new_user_path
  	end
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	@user.save
  	redirect_to @user
  end

  def show
  	@user = User.find(params[:id])
  	if @user != current_user
  		redirect_to root_path
  	end
  end

  def index
  	@users = User.all
  end

  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
  	session[:user_id] = nil
  	current_user = nil
  	flash[:notice] = "Account Deleted"
  	redirect_to root_path
  end

  private

  def user_params
  	params.require(:user).permit(:username, :email, :lname, :fname, :password)
  end
end
