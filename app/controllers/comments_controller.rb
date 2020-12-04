class CommentsController < ApplicationController
  def create
    if user_signed_in?
    @comment = Comment.create(text: comment_params[:text], blog_id: comment_params[:blog_id], user_id: current_user.id)
    redirect_to "/blogs/#{@comment.blog.id}"
    else
    @comment = Comment.create(text: comment_params[:text], blog_id: comment_params[:blog_id], user_id: 1000000)
    redirect_to "/blogs/#{@comment.blog.id}"
    end
  end

  private
  def comment_params
    params.permit(:text, :blog_id)
  end
end
