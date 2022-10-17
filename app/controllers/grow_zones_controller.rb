 class GrowZonesController <ApplicationController
  def index
    @grow_zones = GrowZone.all.order(created_at: :asc)
  end

  def new
  end

  def create
    grow_zone = GrowZone.create!(grow_zone_params)
    redirect_to "/grow_zones"
  end

  def show
    @grow_zone = GrowZone.find(params[:id])
  end

  def grow_zone_params
    params.permit(:name, :sq_feet, :mulched)
  end 

end
