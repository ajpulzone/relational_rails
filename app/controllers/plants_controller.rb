class PlantsController < ApplicationController
  def index
    @plants = Plant.all
  end

  def create
    # plant = Plant.new({
    #   id: params[:id],
    #   name: params[:plants][:name],
    #   sq_feet: params[:plants][:edible],
    #   mulched: params[:plants][:harvest_qt]
    # })
    # grow_zone.save
    # redirect_to "/"
  end

  def show
    @plant = Plant.find(params[:id])
  end
end