class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Profile successfully updated"
      redirect_to @user
    else
      render :edit
    end
  end


private
  def user_params
    params.require(:user).permit(:username, :password, :full_name, :email, :wordpress_username)
  end

end
