class FollowController < ApplicationController
  def follower_id:integer
    a = Article.find params[:id]
    a.user.id
  end

  def followee_id:integer
    current_user.id
  end
end
