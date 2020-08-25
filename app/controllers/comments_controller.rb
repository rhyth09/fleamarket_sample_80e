class CommentsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @comment = Comment.create(comment_params)
  end

  def destroy
    @comment = Comment.find(params[:id])
    if user_signed_in? && current_user.id == @comment.seller_id
      @comment.destroy
      redirect_to item_path(params[:item_id])
    else
      redirect_to item_path(params[:item_id]), alert: :'ログイン済みのコメント投稿者本人のみがコメントを削除できます'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(seller_id: current_user.id, item_id: params[:item_id])
  end
end

