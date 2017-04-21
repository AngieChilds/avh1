class UsersController < ApplicationController
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
    @users = User.all
  end
  
  
  
  
  def edit
    @user = User.find(params[:id])
  end
  
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
     flash[:success] = "Profile updated"
     redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
  
  
  
  
  
  
  
  private

    def user_params
      params.require(:user).permit(:player, :email, :password, :password_confirmation)
                                   
    end 
  
     # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
    
    
    
    
      
  
  
  
end
