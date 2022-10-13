class GrowZonesController <ApplicationController
  def index
    @grow_zones = GrowZone.all
  end

  def new
  end

  def create
    grow_zone = GrowZones.new({
      id: params[:id],
      name: params[:grow_zones][:name],
      sq_feet: params[:grow_zones][:sq_feet],
      mulched: params[:grow_zones][:mulched]
    })
    grow_zone.save
    redirect_to "/"
  end

  def show
  end

end