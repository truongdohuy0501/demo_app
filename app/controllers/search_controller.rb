class SearchController < ApplicationController
  def search
    if params[:q].nil?
      @articles = []
    else
      @articles = Article.search params[:q], match: :word_start, highlight: true
      @articles= @articles.with_highlights
    end
    params.delete :q
  end

  def autocomplete
    render json: Article.search(params[:q], {
      fields: ["title"],
      limit: 10
      }).map(&:title)
  end
end
