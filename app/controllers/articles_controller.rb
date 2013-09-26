class ArticlesController < ApplicationController

  before_filter :authenticate_user!
  
  def new
    @group = Group.find(params[:group_id])
    @article = @group.articles.build
    
  end

  def create
    @article = Article.new(params[:article])
    @article.user_id = current_user.id    
    @article.articletopics.build
    
    if @article.save
      render @article
    end
  end
  
  def show
    @group = Group.find(params[:group_id]) 
    @article = Article.find(params[:id])
    @comments = @article.comment_threads.order('created_at asc')
    @new_comment = Comment.build_from(@article, current_user, " ", " ")
    @large_slides = @article.large_slides
  end

  def edit
    @group = Group.find(params[:group_id])
    @article = @group.articles.find_by_id(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    @article.update_attributes(params[:article])
    if @article.save
      render @article
    end
  end
end
