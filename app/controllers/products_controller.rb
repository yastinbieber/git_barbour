class ProductsController < ApplicationController
  
  def index
    @products = Product.page(params[:page]).per(15).order("created_at DESC")
  end
  
  def new
    @product = Product.new
  end
  
  def create
    @product = Product.create(title: product_params[:title], price: product_params[:price], linkurl: product_params[:linkurl], image: product_params[:image], user_id: current_user.id)
    redirect_to @product
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to action: :index
  end
  
  def edit
    @product = Product.find(params[:id])
  end
  
  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to @product
  end
  
  private
  def product_params
    params.require(:product).permit(:title, :price, :linkurl, :image)
  end
  
end
