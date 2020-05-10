class ArticlesController < ApplicationController
  before_action :set_article, only: [:like]

  def index
    @articles = ArticlesService.call
  end

  def like
    @article.like!
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end
end
