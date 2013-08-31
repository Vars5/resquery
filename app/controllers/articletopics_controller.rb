class ArticletopicsController < ApplicationController
  
  def create
    @articletopic = Articletopic.new(params[:articletopic])  
  end

end
