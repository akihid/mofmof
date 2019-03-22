class PropertiesController < ApplicationController
  def index
    @properties = Property.all
  end
  def new
    @property = Property.new()

    2.times { @property.closet_stations.build }
  end

  def create
    @property = Property.new(set_params)
    # @property.closet_stations.property_id = @property.id
    if @property.save!
      redirect_to properties_path
    else
      render 'new'
    end
  end

  def show
    @property = Property.find(params[:id])
    @closet_stations = ClosetStation.where(property_id: params[:id])
  end

  private

  def set_params
    params.require(:property).permit(:name, :rent ,:address, :age, :remark ,
       closet_stations_attributes: [:close_number, :route_name, :station_name, :walikng_to_closest_station_minutes])
  end
end
