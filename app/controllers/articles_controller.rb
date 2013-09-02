class ArticlesController < ApplicationController
  
  def new
    @group = Group.find(params[:group_id])
    @article = @group.articles.build
    
  end

  def create
    @article = Article.new(params[:article])
    @article.articletopics.build
    
    if @article.save
      redirect_to root_path
    end
  end
  
  def show
    @group = Group.find(params[:group_id]) 
    @article = Article.find(params[:id])
  end

  def edit
  end
end
