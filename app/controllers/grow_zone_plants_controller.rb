class GrowZonePlantsController < ApplicationController

  def index
    grow_zone = GrowZone.find(params[:grow_zone_id])
    @plants = grow_zone.plants
  end
end