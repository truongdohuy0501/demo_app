class SearchController < ApplicationController
  def search
    if params[:q].nil?
      @articles = []
    else
      @articles = Article.search params[:q]
    end
    params.delete :q
  end
end
