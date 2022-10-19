class PlantsController < ApplicationController

  def index
    @plants = Plant.where({edible: true})
  end

  def create
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
    params.permit(:name, :edible, :harvest_qt, :grow_zone_id)
  end
end