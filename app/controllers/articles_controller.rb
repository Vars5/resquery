class ArticlesController < ApplicationController
  
  def new
    @article = Article.new
    
  end

  def create
    @article = Article.new(params[:article])
    @article.articletopics.build
    
    if @article.save
      redirect_to root_path
    end
  end
  
  def show
  end

  def edit
  end
end
