class UsersController < ApplicationController
before_action :set_user, except:[:index]
before_action :ensure_role_is_teacher, only:[:index]
before_action :ensure_self_or_teacher, except: [:index]

  def index
    @users = User.all
  end


  def show
    if @user.blog
      @blog_posts = @user.blog_posts
    end
  end

  def compare
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Profile successfully updated"
      redirect_to @user
    else
      render :edit
    end
  end


private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :full_name, :email, :wordpress_username)
  end

end
