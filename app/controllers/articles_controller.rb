class ArticlesController < ApplicationController
  protect_from_forgery with: :exception
  # before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  # skip_before_filter :verify_authenticity_token

	def index
    @articles = Article.all
    @option = 'slider'
    @option2 = 'slides'
  end

	def show
    @article = Article.find(params[:id])
  end

  def show_user_posts
    if user_signed_in?
      @userPosts = current_user.articles.all
    else
      redirect_to root_path
    end
  end

  def posts

  end

	def new
		@article = Article.new
	end

	def edit
    @article = Article.find(params[:id])
  end

	def create
		# @article = Article.new(article_params)
    @article = current_user.articles.create!(article_params)
     
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
	end

	def update
    @article = Article.find(params[:id])
   
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

	private
  def article_params
    params.require(:article).permit(:title, :text, :photo)
  end

end