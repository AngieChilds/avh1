class ShowblogsController < ApplicationController
 before_action :logged_in_user, only: [:index, :new, :edit, :update, :destroy]
 before_action :trusty_user,    only: [:new, :edit, :update, :destroy]
 before_action :moderator_user, only: [:edit, :update, :destroy]

   def create
    @showblog = Showblog.new(showblog_params)
    
    if @showblog.save
     flash.now[:success] = "Showblog created"
    redirect_to showblogs_url
    else
      render 'new'
    end
  end
  
  def show
    @showblog = Showblog.find(params[:id])
    
  end
  
  def new
    @showblog = Showblog.new
  end
  
  def index
    @showblogs = Showblog.all
   
  end
  def edit
    @showblog = Showblog.find(params[:id])
  end
  
  
  def update
    @showblog = Showblog.find(params[:id])
    if @showblog.update_attributes(showblog_params)
     flash.now[:success] = "showblog updated"
     redirect_to showblogs_url
    else
      render 'edit'
    end
  end
  def destroy
    Showblog.find(params[:id]).destroy
    redirect_to showblogs_url
  end
 
  
  
  
  
  private
  
  def showblog_params
    params.require(:showblog).permit(:name, :rundate, :spec_choice, :level_range, :note).merge(user_id: current_user.id)
  end
  
end
