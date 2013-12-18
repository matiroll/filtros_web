class ListaPreciosController < ApplicationController
  # GET /lista_precios
  # GET /lista_precios.xml
  def index
    @lista_precios = ListaPrecio.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lista_precios }
    end
  end

  # GET /lista_precios/1
  # GET /lista_precios/1.xml
  def show
    @lista_precio = ListaPrecio.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lista_precio }
    end
  end

  # GET /lista_precios/new
  # GET /lista_precios/new.xml
  def new
    @lista_precio = ListaPrecio.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lista_precio }
    end
  end

  # GET /lista_precios/1/edit
  def edit
    @lista_precio = ListaPrecio.find(params[:id])
  end

  # POST /lista_precios
  # POST /lista_precios.xml
  def create
    @lista_precio = ListaPrecio.new(params[:lista_precio])

    respond_to do |format|
      if @lista_precio.save
        format.html { redirect_to(@lista_precio, :notice => 'ListaPrecio was successfully created.') }
        format.xml  { render :xml => @lista_precio, :status => :created, :location => @lista_precio }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @lista_precio.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /lista_precios/1
  # PUT /lista_precios/1.xml
  def update
    @lista_precio = ListaPrecio.find(params[:id])

    respond_to do |format|
      if @lista_precio.update_attributes(params[:lista_precio])
        format.html { redirect_to(@lista_precio, :notice => 'ListaPrecio was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @lista_precio.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /lista_precios/1
  # DELETE /lista_precios/1.xml
  def destroy
    @lista_precio = ListaPrecio.find(params[:id])
    @lista_precio.destroy

    respond_to do |format|
      format.html { redirect_to(lista_precios_url) }
      format.xml  { head :ok }
    end
  end
end
