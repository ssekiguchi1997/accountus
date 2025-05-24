class PostCommentsController < ApplicationController

  def create
    tip = Tip.find(params[:tip_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.tip_id = tip.id
    if comment.save
      flash[:notice] = "Comment was successfully created."
      redirect_to tip_path(tip)
    else
      flash[:alert] = "Comment could not be created."
      redirect_to tip_path(tip)
    end
  end
    
  def destroy
    PostComment.find(params[:id]).destroy
    flash[:notice] = "Comment was successfully destroyed."
    redirect_to tip_path(params[:tip_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
