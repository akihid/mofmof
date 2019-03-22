class PropertiesController < ApplicationController
  before_action :set_property ,only:[:edit, :update , :show ,:destroy]

  def index
    @properties = Property.all
  end
  def new
    @property = Property.new()

    2.times { @property.closet_stations.new() }
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to properties_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    
    if @property.update(property_params)
      redirect_to properties_path
    else
      render 'edit'
    end
  end

  def show
    @closet_stations = ClosetStation.where(property_id: params[:id])
  end

  def destroy
    @property.destroy
    redirect_to properties_path
  end

  private
  def property_params
    params.require(:property).permit(:name, :rent ,:address, :age, :remark ,
       closet_stations_attributes: [:close_number, :route_name, :station_name, :walikng_to_closest_station_minutes, :id])
  end

  def set_property
    @property = Property.includes(:closet_stations).find(params[:id])
  end
end
