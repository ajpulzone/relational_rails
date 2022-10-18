class GrowZonePlantsController < ApplicationController

  def index
    @grow_zone = GrowZone.find(params[:grow_zone_id])
    @plants = @grow_zone.plants
  end
  
  def new
    @grow_zone = GrowZone.find(params[:grow_zone_id])
  end

  def create
    @grow_zone = GrowZone.find(params[:grow_zone_id]) 
    @plant = Plant.create!(plant_params)
    redirect_to "/grow_zones/#{@grow_zone.id}/plants"
  end

  def plant_params
    params.permit(:name, :edible, :harvest_qt, :grow_zone_id)
  end

end