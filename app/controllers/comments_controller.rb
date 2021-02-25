class CommentsController < ApplicationController
  def create 
    @comment = current_user.comments.new(comment_params) 
    @comment.community_id = params[:community_id]
    if @comment.save!  #@commentにcomments.community_idを渡す、ここが空だとエラーが出ている。
     
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: root_path)
    else
      flash[:success] = "コメントできませんでした"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    comment = Comment.find(params[:id]) #dbからCommentモデル
    comment.destroy
    redirect_to communities_path, notice: "投稿を削除しました。"
  end

  
    private
    def comment_params
      params.require(:comment).permit(:content)
    end

end


