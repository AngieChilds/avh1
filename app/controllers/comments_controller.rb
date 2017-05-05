class CommentsController < ApplicationController

 def create
    @board = Board.find(params[:board_id])
    @comment = @board.comments.create(comment_params)
    redirect_to board_path(@board)
  end
 def edit
   @comment = @board.comments.find(params[:id])
 end
 
 
 def update
    @comment = @board.comments.find(params[:id])
    if @board.comments.update_attributes(comment_params)
     flash.now[:success] = "Comment updated"
     redirect_to board_path(@board)
    else
      render 'edit'
    end
  end
 
 
 
 
 
 
 
 def destroy
    @board = Board.find(params[:board_id])
    @comment = @board.comments.find(params[:id])
    @comment.destroy
    redirect_to boards_url
  end
 
 
  private
    def comment_params
      params.require(:comment).permit(:body).merge(user_id: current_user.id)
    end
end