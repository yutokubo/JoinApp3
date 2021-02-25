class CommunitiesController < ApplicationController
  before_action :set_community, only: [:edit,:show,:update]

  def index
    @communities = Community.all
  end

  def show
    @comments = @community.comments   #投稿詳細に関連付けてあるコメントを全取得
   
    @comment = Comment.new   #投稿詳細画面でコメントの投稿を行うので、formのパラメータ用にCommentオブジェクトを取得
  end

  def edit

    @community = Community.find(params[:id])

  end

  def new
    @community = Community.new
  end

  def create
    @community = current_user.communities.build(community_params)
    if @community.save
      redirect_to community_path(@community), notice: "投稿に成功しました。"
    else
      render :new
    end
  end


  def update
    if @community.update(community_params)
       redirect_to community_path, notice: "投稿を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    community = Community.find(params[:id])
    community.destroy
    redirect_to communities_path, notice: "投稿を削除しました。"
  end


  private
  def community_params
    params.require(:community).permit(:title, :body, :image, :content)
  end

  def set_community
    @community = Community.find(params[:id])
  end

end
