class BlogsController < ApplicationController


  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params.merge(user_id: current_user.id))
    if @blog.save
      flash[:notice] = "New Blog added"
      redirect_to user_path(current_user)
    else
      render :new
    end
  end



private
  def blog_params
    params.require(:blog).permit(:url, :description, :user_id)
  end

end
