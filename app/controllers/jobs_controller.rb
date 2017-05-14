class JobsController < ApplicationController
 

   
  def index
    @comp = Comp.find(params[:comp_id])
    @jobs = @comp.jobs.order(amount: "DESC")
  end

  
  def show
    @comp = Comp.find(params[:comp_id])
    @job = @comp.jobs.find(params[:id])
   
    render :show
   
    
  end

  def new
    @comp = Comp.find(params[:comp_id])
    @job = @comp.jobs.build
  
  end
   
  def edit
    @comp = Comp.find(params[:comp_id])
    @job = @comp.jobs.find(params[:id])
   
  end
    
  def create
    @comp = Comp.find(params[:comp_id])
    @job = @comp.jobs.create(job_params)
    if @job.save
    flash.now[:success] = "Job entry created"
    redirect_to comps_path(@comp)
    
    else
      render :new
    end
  end

  

 
  def update
    @comp = Comp.find(params[:comp_id])
    @job = @comp.jobs.find(params[:id])
   if @job.update_attributes(job_params)
    flash.now[:success] = "Job updated"
 
    redirect_to([@job.comp, @job])
    else
   render 'edit'
    end
  end

  
  def destroy
    @comp = Comp.find(params[:comp_id])
    @job = @comp.jobs.find(params[:id])
    @job.destroy
   redirect_to comp_jobs_url
    
  end
  
  

  private
  def sort_column
  @comp.jobs.column_names.includes?(params[:sort]) ? params[:sort] : "text"
   end
  def sort_direction
  %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end
 
  
  
  
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @comp = Comp.find(params[:comp_id])
       @job = @comp.jobs.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:text, :amount, :failed, :comp_id).merge(user_id: current_user.id)
    end
end



 
 
