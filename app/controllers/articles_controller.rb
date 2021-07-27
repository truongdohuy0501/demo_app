class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
  end

  def create
    @articles = Article.new article_params
    if @articles.save
      redirect_to @articles
    else
      render 'new'
    end
  end

  def destroy
    @article = Article.destroy(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
