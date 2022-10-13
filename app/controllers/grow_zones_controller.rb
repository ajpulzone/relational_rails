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
    @grow_zone = GrowZone.find(params[:id])
    #get the grow zone that is specified, access the database
    #need to get the id
    #access the database and save id to an instance variable
    #that you can access in your view
  end

end