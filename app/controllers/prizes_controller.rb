class PrizesController < ApplicationController
   
  def index
    @comp = Comp.find(params[:comp_id])
    @prize = @comp.prizes
  end

  
  def show
    @comp = Comp.find(params[:comp_id])
    @prize = @comp.prizes.find(params[:id])
   redirect_to comp
    
  end

  
  def new
    @comp = Comp.find(params[:comp_id])
    @prize = Prize.new(prize_params)
  end

 
  def edit
    @comp = Comp.find(params[:comp_id])
    @prize = @comp.prizes.find(params[:id])
  end

  def create
    @comp = Comp.find(params[:comp_id])
    @prize = @comp.prizes.create(prize_params)
    if @prize.save
    flash.now[:success] = "Prize created"
    redirect_to comp_path(@comp)
    
    else
      render :new
    end
  end

  

 
  def update
    @comp = Comp.find(params[:comp_id])
    @prize = @comp.prizes.find(params[:id])
   if @prize.update_attributes(prize_params)
    flash.now[:success] = "Prize updated"
    redirect_to comp

    else
   render 'edit'
    end
  end

  
  def destroy
    @comp = Comp.find(params[:comp_id])
    @prize = @comp.prizes.find(params[:id])
    @prize.destroy
   redirect_to comps_url
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prize
      @comp = Comp.find(params[:comp_id])
       @prize = @comp.prizes.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prize_params
      params.require(:prize).permit(:text).merge(user_id: current_user.id)
    end
end

