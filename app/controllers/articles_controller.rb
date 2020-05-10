class ArticlesController < ApplicationController

  def index
    @articles = ArticlesService.call
  end
end
