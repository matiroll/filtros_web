class FiltroVehiculosController < ApplicationController
      before_filter :require_login
# GET /filtro_vehiculos
  # GET /filtro_vehiculos.xml
  def index
    @filtro_vehiculos = FiltroVehiculo.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @filtro_vehiculos }
    end
  end

  # GET /filtro_vehiculos/1
  # GET /filtro_vehiculos/1.xml
  def show
    @filtro_vehiculo = FiltroVehiculo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @filtro_vehiculo }
    end
  end

  # GET /filtro_vehiculos/new
  # GET /filtro_vehiculos/new.xml
  def new
    @filtro_vehiculo = FiltroVehiculo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @filtro_vehiculo }
    end
  end

  # GET /filtro_vehiculos/1/edit
  def edit
    @filtro_vehiculo = FiltroVehiculo.find(params[:id])
  end

  # POST /filtro_vehiculos
  # POST /filtro_vehiculos.xml
  def create
    @filtro_vehiculo = FiltroVehiculo.new(params[:filtro_vehiculo])

    respond_to do |format|
      if @filtro_vehiculo.save
        format.html { redirect_to(@filtro_vehiculo, :notice => 'FiltroVehiculo was successfully created.') }
        format.xml  { render :xml => @filtro_vehiculo, :status => :created, :location => @filtro_vehiculo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @filtro_vehiculo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /filtro_vehiculos/1
  # PUT /filtro_vehiculos/1.xml
  def update
    @filtro_vehiculo = FiltroVehiculo.find(params[:id])

    respond_to do |format|
      if @filtro_vehiculo.update_attributes(params[:filtro_vehiculo])
        format.html { redirect_to(@filtro_vehiculo, :notice => 'FiltroVehiculo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @filtro_vehiculo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /filtro_vehiculos/1
  # DELETE /filtro_vehiculos/1.xml
  def destroy
    @filtro_vehiculo = FiltroVehiculo.find(params[:id])
    @filtro_vehiculo.destroy

    respond_to do |format|
      format.html { redirect_to(filtro_vehiculos_url) }
      format.xml  { head :ok }
    end
  end
end
