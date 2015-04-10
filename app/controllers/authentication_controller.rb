class AuthenticationController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      if @user.role == "Student"
        redirect_to user_path(@user)
      else
        redirect_to users_path
      end
    else
      flash[:notice] = "Username and password don't match"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
