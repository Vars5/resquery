class GroupsController < ApplicationController
  
  before_filter :authenticate_user!
  
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
  end

  def index
    @groups = current_user.groups.all
  end
  
  def destroy
  end
end
