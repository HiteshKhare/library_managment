class ArticlesController < ApplicationController
  def index

    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    if current_user.present?
      @article = Article.new
    else
      redirect_to new_user_session_url
    end
  end

  def create
    @article = Article.new(article_params)
    @article.user_id  = current_user.id
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit
    @article = Article.find_by(id: params[:id])
  end

  def update
    @article = Article.find_by(id: params[:id])
    @article.avatar.attach(params[:article][:avatar])
    @article.user_id  = current_user.id
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end 
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

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
    if current_user.following.find_by(followee_id: @article.id).destroy
      redirect_back(fallback_location: article_path(@article))
    else
      render :show
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :avatar, :status, :follow, :unfollow)
    end
end
