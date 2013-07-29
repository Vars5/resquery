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
        
        @groupmembers = @group.users.where('sign_in_count > 0')
        @groupmembers.each do |user|
          UserMailer.new_discussion(user, @group, @discussion, current_user).deliver
        end
    else
        render 'new'
    end
  end
  
  def edit
  end

  def show
    #@group = Group.find(params[:id])
    @discussion = Discussion.find(params[:id])
    
#    @memberships = @group.users   
    @comments = @discussion.comment_threads.order('created_at asc')
    @new_comment = Comment.build_from(@discussion, current_user, "")
    
  end
end
