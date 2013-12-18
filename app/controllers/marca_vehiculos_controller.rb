class MarcaVehiculosController < ApplicationController
  # GET /marca_vehiculos
  # GET /marca_vehiculos.xml
  def index
    @marca_vehiculos = MarcaVehiculo.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @marca_vehiculos }
    end
  end

  # GET /marca_vehiculos/1
  # GET /marca_vehiculos/1.xml
  def show
    @marca_vehiculo = MarcaVehiculo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @marca_vehiculo }
    end
  end

  # GET /marca_vehiculos/new
  # GET /marca_vehiculos/new.xml
  def new
    @marca_vehiculo = MarcaVehiculo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @marca_vehiculo }
    end
  end

  # GET /marca_vehiculos/1/edit
  def edit
    @marca_vehiculo = MarcaVehiculo.find(params[:id])
  end

  # POST /marca_vehiculos
  # POST /marca_vehiculos.xml
  def create
    @marca_vehiculo = MarcaVehiculo.new(params[:marca_vehiculo])

    respond_to do |format|
      if @marca_vehiculo.save
        format.html { redirect_to(@marca_vehiculo, :notice => 'MarcaVehiculo was successfully created.') }
        format.xml  { render :xml => @marca_vehiculo, :status => :created, :location => @marca_vehiculo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @marca_vehiculo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /marca_vehiculos/1
  # PUT /marca_vehiculos/1.xml
  def update
    @marca_vehiculo = MarcaVehiculo.find(params[:id])

    respond_to do |format|
      if @marca_vehiculo.update_attributes(params[:marca_vehiculo])
        format.html { redirect_to(@marca_vehiculo, :notice => 'MarcaVehiculo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @marca_vehiculo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /marca_vehiculos/1
  # DELETE /marca_vehiculos/1.xml
  def destroy
    @marca_vehiculo = MarcaVehiculo.find(params[:id])
    @marca_vehiculo.destroy

    respond_to do |format|
      format.html { redirect_to(marca_vehiculos_url) }
      format.xml  { head :ok }
    end
  end
end
