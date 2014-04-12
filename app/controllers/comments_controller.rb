class CommentsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]

  def create
    @entry = Entry.find(params[:comment][:entry_id])
    @comment = @entry.comments.create(comment_params)
    if @comment.save
      redirect_to :back
    else
      flash.now[:error] = "comment fail!"    
    end
  end

  def new
    @comment = Comment.new
  end 
 
  private
    def comment_params
      params.require(:comment).permit(:name, :comment)
    end
  
end
