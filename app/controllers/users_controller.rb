class UsersController < ApplicationController
 before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
 before_action :correct_user,   only: [:edit, :update]
 before_action :admin_user,     only: :destroy
    
  def new
   @user = User.new
 end
  
  def show
    @user = User.find(params[:id])
  end
  
def create
    @user = User.new(user_params)    
    if @user.save
      log_in @user
      flash[:success] = "Welcome to AVH1"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def index
    @users = User.paginate(page: params[:page])
  end
  
  
  
  
  def edit
    @user = User.find(params[:id])
  end
  
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
     flash.now[:success] = "Player updated"
     redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Player deleted"
    redirect_to users_url
  end
  
  def tr
    @user = User.find(params[:id])
    @user.update_attributes(status: "trusty")
    redirect_to users_url
  end
  
  def mod
    @user = User.find(params[:id])
    @user.update_attributes(status: "moderator")
    redirect_to users_url
  end
  
  def moderator_user 
       @user.find(params[:id])
       if current_user[:status]>=User.status[:moderator]
       
       else
       redirect_to(root_url)
             
       end
    end
  
  private

    def user_params
      params.require(:user).permit(:player, :email, :status, :password, :password_confirmation)
                                   
    end 
  
     # Confirms an admin user.
    
    def trusty_user
     @user.find(params[:id])
     User.where({status: ["moderator", "admin"]})
     redirect_to(root_url) unless current_user.trusty? 
     end
    
    
    
        
    def admin_user
      @user = User.find(params[:id])
     redirect_to(root_url) unless current_user.admin?
     end
     
     
    
 # Before filters

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end   
    
    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless ( current_user?(@user) || current_user.admin? )
    end
      
  
  
end
