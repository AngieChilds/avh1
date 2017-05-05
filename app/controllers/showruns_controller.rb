class ShowrunsController < ApplicationController
 before_action :logged_in_user, only: [:index, :new, :edit, :update, :destroy]
 before_action :trusty_user,    only: [:edit, :update, :destroy]

  
  def index
    @showblog = Showblog.find(params[:showblog_id])
    @showrun = @showblog.showruns.find(:all).order(event: "ASC")

   #showblog_showruns GET    /showblogs/:showblog_id/showruns(.:format)
  end


  def create
    @showblog = Showblog.find(params[:showblog_id])
    @showrun = @showblog.showruns.create(showrun_params)
    flash.now[:success] = "Showrun entry created"
    redirect_to showblog_path(@showblog)
    # new_showblog_showrun GET    /showblogs/:showblog_id/showruns/new(.:format)
  end
  



  def destroy
     @showblog = Showblog.find(params[:showblog_id])
    @showrun = @showblog.showruns.find(params[:id])
    @showrun.destroy
     redirect_back_or showblogs_url
         #  DELETE /showblogs/:showblog_id/showruns/:id(.:format)
 end
   
 def show
    showblog = Showblog.find(params[:showblog_id])
#showruns#show PATCH  /showblogs/:showblog_id/showruns/:id(.:format)
    @showrun = showblog.showruns.find(params[:id])
   redirect_back_or showblog
end



 def update 
   showblog = Showblog.find(params[:showblog_id])
  @showrun = showblog.showruns.find(params[:id])
   if @showrun.update_attributes(showrun_params)
    flash.now[:success] = "showrun entry updated"
    redirect_back_or showblog
#/showblogs/:showblog_id/showruns/:id(.:format
 else
   render 'edit'
 end
 end
def edit
    showblog = Showblog.find(params[:showblog_id])
    @showrun = showblog.showruns.find(params[:id])
     end
#edit_showblog_showrun GET    /showblogs/:showblog_id/showruns/:id/edit(.:format) showruns#edit

  
 private
 
def showrun_params
  params.require(:showrun).permit(:other_player, :spec_vote, :event, :make_other, :amt, :level_to_make).merge(user_id: current_user.id)
  
end




def sort_column
  @showblog.showruns.column_names.includes?(params[:sort]) ? params[:sort] : "player"
end
def sort_direction
  %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
end
 
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
end
