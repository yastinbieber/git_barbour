class PicpagesController < ApplicationController

  def index
    @picpages = Picpage.page(params[:page]).per(20).order("created_at DESC")
  end
  
  def new
    @picpage = Picpage.new
  end
  
  def create
    @picpage = Picpage.create params.require(:picpage).permit(:title, images: [])
    redirect_to @picpage
  end
  
  def show
    @picpage = Picpage.find(params[:id])
  end
  
  def destroy
    @picpage = Picpage.find(params[:id])
    @picpage.destroy
  end
  
  def edit
    @picpage = Picpage.find(params[:id])
  end
  
  def update
    @picpage = Picpage.find(params[:id])
    @picpage.update params.require(:picpage).permit(:title, images: [])
    redirect_to @picpage
  end
  
  private
  def picpage_params
    params.require(:picpage).permit(:title, images: [])
  end

end
