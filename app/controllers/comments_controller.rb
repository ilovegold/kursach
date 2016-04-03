class CommentsController < ApplicationController

	def index
	  @comment = Comment.new(comment_params)
	  @comment.book_id = params[:book_id]
	  @comment.user_id = current_user.id
	  @comment.save!
	  redirect_to book_path(@comment.book_id)
	end

	private

  	def comment_params
      params.require(:comment).permit(:content)
	end
end
