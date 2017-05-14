class RulesController < ApplicationController
  def index
    @comp = Comp.find(params[:comp_id])
    @rule = @comp.rules
  end

  
  def show
    @comp = Comp.find(params[:comp_id])
    @rule = @comp.rules.find(params[:id])
   redirect_to comp
    
  end

  
  def new
    @comp = Comp.find(params[:comp_id])
    @rule = Rule.new(rule_params)
  end

 
  def edit
    @comp = Comp.find(params[:comp_id])
    @rule = @comp.rules.find(params[:id])
  end

  
  def create
    @comp = Comp.find(params[:comp_id])
    @rule = @comp.rules.create(rule_params)
    if @rule.save
    flash.now[:success] = "Rule created"
    redirect_to comp_path(@comp)
   
    else
      render :new
    
    end
  end

 
  def update
    @comp = Comp.find(params[:comp_id])
    @rule = @comp.rules.find(params[:id])
   if @rule.update_attributes(rule_params)
    flash.now[:success] = "Rule updated"
    redirect_to comp

    else
   render 'edit'
    end
  end

  
  def destroy
    @comp = Comp.find(params[:comp_id])
    @rule = @comp.rules.find(params[:id])
    @rule.destroy
   redirect_to comps_url
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rule
      @comp = Comp.find(params[:comp_id])
       @rule = @comp.rules.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rule_params
      params.require(:rule).permit(:text).merge(user_id: current_user.id)
    end
end

