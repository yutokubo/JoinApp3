class FollowsController < ApplicationController
  before_action :set_variables
  def create
    @follow = current_user.follows.create(community_id:params[:community_id])#フォローしたいコミュニティにフォローを追加する
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @community = Community.find(params[:community_id])#フォローを削除したいコミュニティを探す
    @follow = current_user.follows.find_by(community_id: @community.id)#コミュニティに結びついているフォローを探す
    @follow.destroy#フォローを削除
     redirect_back(fallback_location: root_path)

  end

  private
  def set_variables
    @community = Community.find(params[:community_id])
    @id_name = "#follow-follow-#{@community.id}"
  end

end
