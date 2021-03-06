class DiscussionsController < ApplicationController
  
  before_filter :authenticate_user!
  load_and_authorize_resource :group
  load_and_authorize_resource :through => :group
  
  
  def new
    @group = Group.find(params[:group_id])
    @discussion = Discussion.new
  end

  def create
    @group = Group.find(params[:group_id])
    @discussion = @group.discussions.build(params[:discussion])
    if @discussion.save
      redirect_to [@group, @discussion]
    else
      render 'new'
    end
  end
  
  def edit
    @group = Group.find(params[:group_id])
    @discussion = @group.discussions.find(params[:id])
  end
  
  def update
    @discussion.update_attributes(params[:discussion])
    if @discussion.save
      redirect_to [@group, @discussion]
    end
  end

  def show
    @group = Group.find(params[:group_id]) 
    @discussion = Discussion.find(params[:id])
    #@memberships = @group.users   
    @comments = @discussion.comment_threads.order('created_at asc')
    @new_comment = Comment.build_from(@discussion, current_user, "")
  end
  
  def destroy
    @group = Group.find(params[:group_id])
    @discussion = @group.discussions.find(params[:id]).destroy
    if @discussion.destroy
      redirect_to @group
    end
  end
end
