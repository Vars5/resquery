class ArticlesController < ApplicationController
  
  def new
    @group = Group.find(params[:group_id])
    @article = @group.articles.build
    
  end

  def create
    @article = Article.new(params[:article])
    @article.user_id = current_user.id    
    @article.articletopics.build
    
    if @article.save
      redirect_to root_path
    end
  end
  
  def show
    @group = Group.find(params[:group_id]) 
    @article = Article.find(params[:id])
    @comments = @article.comment_threads.order('created_at asc')
    @new_comment = Comment.build_from(@article, current_user, "")
  end

  def edit
  end
end
