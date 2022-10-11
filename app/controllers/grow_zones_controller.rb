class GrowZonesController <ApplicationController
  def index
    @grow_zones = GrowZones.all
  end

  def new
  end

  def create
    grow_zone = GrowZones.new({
      id: params[:id],
      title: params[:grow_zones][:title],
    })
    grow_zone.save
    redirect_to "/"
  end
end