class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])   
  end

  def new
  end

  def edit
    @article = Article.find(params[:id])  
  end

  def create
    @article = Article.new article_params
    if @article.valid?
      @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      # flash.now[:notice] =  @article.errors.full_messages.to_sentence
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
