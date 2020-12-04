class BlogsController < ApplicationController
  
  def index
    @blogs = Blog.page(params[:page]).per(10).order("created_at DESC")
    @blogs_desc = Blog.page(params[:page]).per(5).order("created_at DESC")
  end
  
  def new
    @blog = Blog.new
  end
  
  def create
    @blog = Blog.create(title: blog_params[:title], text: blog_params[:text], image: blog_params[:image], user_id: current_user.id)
    redirect_to action: :index
  end
  
  def show
    @blog = Blog.find(params[:id])
    @comments = @blog.comments.includes(:user)
  end
  
  def edit
    @blog = Blog.find(params[:id])
  end
  
  def update
    @blog = Blog.find(params[:id])
    @blog.update(blog_params)
    redirect_to action: :show
  end
  
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to action: :index
  end
  
  def search
    @blogs = Blog.where('title LIKE(?) or text LIKE(?)', "%#{params[:keyword]}%","%#{params[:keyword]}%")
  end
  
  private
  def blog_params
    params.require(:blog).permit(:title, :text, :image)
  end
end
