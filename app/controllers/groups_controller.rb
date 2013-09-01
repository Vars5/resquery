class GroupsController < ApplicationController
  
  before_filter :authenticate_user!
  load_and_authorize_resource 
  
  def new
    @group = Group.new
    @group.memberships.build
  end
  
  def create
    @group = Group.new(params[:group])
    if @group.save
      redirect_to @group
    else
      render 'new'
    end
  end

  def edit
    @group = Group.find(params[:id])
  end
  
  def update
    @group.update_attributes(params[:group])
  end

  def show
    @group = Group.find(params[:id])
    @discussions = @group.discussions.reverse
    @users = @group.users.where('sign_in_count > 0')
    @pending_users = @group.users.where('sign_in_count = 0')
    @links = @group.links.reverse
    @topics = @group.topics
  end

  def index
    # Currently the Dashboard indexes all the groups
    redirect_to root_path
    @groups = current_user.groups
  end
  
  def destroy
    @group = Group.find(params[:id]).destroy
    if @group.destroy
      redirect_to @group
    end
  end
  

  def users
    @group = Group.find(params[:id])
    @users = @group.users.where('sign_in_count > 0')
    @pending_users = @group.users.where('sign_in_count = 0')
  end
  
  def links
    @group = Group.find(params[:id])
    @links = @group.links.reverse
  end
  
end
