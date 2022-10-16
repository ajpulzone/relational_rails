 class GrowZonesController <ApplicationController
  def index
    @grow_zones = GrowZone.all.order(created_at: :asc)
  end

  def new
  end

  def create
    grow_zone = GrowZone.create!(name: params[:name],
      sq_feet: params[:sq_feet],
      mulched: params[:mulched])
    redirect_to "/grow_zones"
  end

  def show
    @grow_zone = GrowZone.find(params[:id])
    #get the grow zone that is specified, access the database
    #need to get the id
    #access the database and save id to an instance variable
    #that you can access in your view
  end

end
