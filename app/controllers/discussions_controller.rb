class DiscussionsController < ApplicationController
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
  end

  def show
    @group = Group.find(params[:group_id])
    @discussion = @group.discussions.find(params[:id])
  end
end
