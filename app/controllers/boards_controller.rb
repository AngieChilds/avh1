class BoardsController < ApplicationController
  
  before_action :logged_in_user,  only: [:create, :index, :edit, :update, :destroy]
  before_action :moderator_user, only: [:create, :index, :edit, :update, :destroy]
 
  def create
    @board = Board.new(board_params)
    
    if @board.save
     flash.now[:success] = "Mod post created"
    redirect_to @board
    else
      render 'new'
    end
  end
  
  def show
    @board = Board.find(params[:id])
    
  end
  
  def new
    @board = Board.new
  end
  
  def index
    @boards = Board.all
   
  end
  
  def destroy
    Board.find(params[:id]).destroy
    redirect_to boards_url
  end
  
  #def player
 # @board = Board.find_by(params[:id])
 #  player = User.where(id: board.user_id).pluck("player")
  #end
  
  
  
  private
  
  def board_params
    params.require(:board).permit(:title, :text).merge(user_id: current_user.id)
  end
  
   
  
  
  
  
  
end
