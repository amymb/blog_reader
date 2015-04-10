class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    if session[:user_id].present?
      User.find(session[:user_id])
    end
  end

  def ensure_role_is_teacher
    if current_user.role != "Teacher"
      flash[:warning] ="You do not have access"
      redirect_to user_path(current_user)
    end
  end

  def ensure_self_or_teacher
    if current_user !=@user && current_user.role !="Teacher"
      flash[:warning] ="You do not have access"
      redirect_to user_path(current_user)
    end
  end
end
