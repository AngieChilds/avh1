module BoardsHelper
  def player

    board = Board.find_by(params[:id])
    player = User.where(id: board.user_id).pluck("player")
   
  end

   
  
end
