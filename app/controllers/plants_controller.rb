class PlantsController < ApplicationController
  def index
    @plants = Plant.all
  end

  def create
    #Creation of plants is currently being done within the 
    #grow_zones_plants controller, it should be done here
    #Will need to fix

    # plant = Plant.new({
    #   id: params[:id],
    #   name: params[:plants][:name],
    #   sq_feet: params[:plants][:edible],
    #   mulched: params[:plants][:harvest_qt]
    # })
    # grow_zone.save
    # redirect_to "/"
  end

  def edit
    @plant = Plant.find(params[:id])
  end

  def show
    @plant = Plant.find(params[:id])
  end
  
  def update
    @plant = Plant.find(params[:id])
    @plant.update(plant_params)
    redirect_to "/plants/#{@plant.id}"
  end

  private
  def plant_params
    params.permit(:name, :edible,:harvest_qt)
  end
end