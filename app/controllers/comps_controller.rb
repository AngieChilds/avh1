class CompsController < ApplicationController
  
 def create
    @comp = Comp.new(comp_params)
    
    if @comp.save
     flash.now[:success] = "Competition created"
    redirect_to comps_url
    else
      render 'new'
    end
  end
  
  def show
    @comp = Comp.find(params[:id])
    
  end
  
  def new
    @comp = Comp.new
  end
  
  def index
    @comps = Comp.all
   
  end
  def edit
    @comp = Comp.find(params[:id])
  end
  
  
  def update
    @comp = Comp.find(params[:id])
    if @comp.update_attributes(comp_params)
     flash.now[:success] = "Competition updated"
     redirect_to comps_url
    else
      render 'edit'
    end
  end
  def destroy
    Comp.find(params[:id]).destroy
    redirect_to comps_url
  end
 
  def pz
    @comp = Comp.find(params[:id])
  end
  
  
  
  
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def edit_params
      params.require(:comp).permit(:foo)
    end
  
    def set_comp
      @comp = Comp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comp_params
      params.require(:comp).permit(:name, :ref_player, :foo, :text, :startdate, 
                                  :enddate, stories_attributes: [:id, :title, :text, :_destroy]).merge(user_id: current_user.id)
    end
end
