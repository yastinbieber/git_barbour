class ApplicationController < ActionController::Base
  
  before_action :blogs_desc, :products_desc, :administrator_user
  def blogs_desc
    @blogs_desc = Blog.page(params[:page]).per(5).order("created_at DESC")
  end
  
  def products_desc
    @products_desc = Product.page(params[:page]).per(3).order("created_at DESC")
  end
  
  def administrator_user
    @administrator_user = User.find(1)
  end
end
