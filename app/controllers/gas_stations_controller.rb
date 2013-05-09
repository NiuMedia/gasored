class GasStationsController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:index]

  # GET /gas_stations
  # GET /gas_stations.json
  def index
    @gas_stations = GasStation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gas_stations, :include => :features }
    end
  end

  # GET /gas_stations/1
  # GET /gas_stations/1.json
  def show
    @gas_station = GasStation.find(params[:id])
    @features = @gas_station.features

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gas_station, :include => :features }
    end
  end

  # GET /gas_stations/new
  # GET /gas_stations/new.json
  def new
    @gas_station = GasStation.new

    @features = Feature.all
    @features_selected = []

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gas_station }
    end
  end

  # GET /gas_stations/1/edit
  def edit
    @gas_station = GasStation.find(params[:id])
    @features = Feature.all
    @features_selected = @gas_station.features
  end

  # POST /gas_stations
  # POST /gas_stations.json
  def create
    @gas_station = GasStation.new(params[:gas_station])

    #@features = Feature.find(params[:feature])
    if params["features"] != nil
      params["features"].each do |feature|
        f = Feature.find(feature)
        @gas_station.features << f
      end
    end

    respond_to do |format|
      if @gas_station.save
        format.html { redirect_to @gas_station, notice: 'Gas station was successfully created.' }
        format.json { render json: @gas_station, status: :created, location: @gas_station }
      else
        format.html { render action: "new" }
        format.json { render json: @gas_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gas_stations/1
  # PUT /gas_stations/1.json
  def update
    @gas_station = GasStation.find(params[:id])
    
    if not params["features"].blank?
      @gas_station.features.destroy_all

      params["features"].each do |feature|
        f = Feature.find(feature)
        @gas_station.features << f
      end
    else
      @gas_station.features.clear
    end

    respond_to do |format|
      if @gas_station.update_attributes(params[:gas_station])
        format.html { redirect_to @gas_station, notice: 'Gas station was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gas_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gas_stations/1
  # DELETE /gas_stations/1.json
  def destroy
    @gas_station = GasStation.find(params[:id])
    @gas_station.destroy

    respond_to do |format|
      format.html { redirect_to gas_stations_url }
      format.json { head :no_content }
    end
  end

  def index_app
    @gasos = GasStation.select("longitud, latitud, nombre, direccion")

    respond_to do |format|
      format.json { render json: @gasos } 
    end
  end

  def detalles_gas
    @gas_station = GasStation.find(params[:id])
    @simple_gas = GasStation.select("longitud, latitud, nombre, direccion")

    respond_to do |format|
      format.json { render json: @simple_gas }
    end
  end  

end
