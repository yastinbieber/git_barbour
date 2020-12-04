class BiosController < ApplicationController
  
  def index
    @bios = Bio.all
  end
  
  def new
    @bio = Bio.new
  end
  
  def create
    @bio = Bio.create(title: bio_params[:title], text: bio_params[:text], image: bio_params[:image], user_id: current_user.id)
    redirect_to action: :index
  end
  
  def edit
    @bio = Bio.find(params[:id])
  end
  
  def update
    @bio = Bio.find(params[:id])
    @bio.update(bio_params)
    redirect_to action: :show
  end
  
  def show
    @bio = Bio.find(1)
  end
  
  private
  def bio_params
    params.require(:bio).permit(:title, :text, :image)
  end
  
end
