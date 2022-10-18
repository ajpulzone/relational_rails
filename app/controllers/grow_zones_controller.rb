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

  def edit
    @grow_zone = GrowZone.find(params[:id])
  end

  def update
    @grow_zone = GrowZone.find(params[:id])
    @grow_zone.update(grow_zone_params)
    redirect_to "/grow_zones/#{@grow_zone.id}"
  end

  private #strong params are only for forms, not website accessibility
  #Need to update this to un-include id,
  def grow_zone_params
    params.permit(:id, :name, :sq_feet, :mulched)
  end 

end
