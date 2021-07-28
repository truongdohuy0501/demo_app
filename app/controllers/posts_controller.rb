
class PostsController < ApplicationController
  before_action :get_article

  def create
    @post = @article.posts.create(post_params)
  end

  def destroy
    @post = @article.posts.find(params[:id])
    @post.destroy
  end

  private

  def get_article
    @article = Article.find(params[:article_id])
  end

  def post_params
    params.require(:post).permit(:body, :article_id)
  end
end