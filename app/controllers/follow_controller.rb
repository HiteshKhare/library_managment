class FollowController < ApplicationController
  def follow
    @article = Article.find(params[:id])
    follow = Follow.new
    follow.follower_id = current_user.id
    follow.followee_id = @article.user_id
    if follow.save
      redirect_to :articles
    else
      render :show
    end
  end

  def unfollow
    @article = Article.find(params[:id])
    if current_user.following.find_by(followee_id: @article).destroy
      redirect_back(fallback_location: article_path(@article))
    else
      render :show
    end
  end
end