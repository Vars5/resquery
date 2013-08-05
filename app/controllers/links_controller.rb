class LinksController < ApplicationController

  def create
    @link = Link.new(params[:link])
    if @link.save
      redirect_to group_path(@link.group_id)
    else
      redirect_to :back
    end
  end







end
