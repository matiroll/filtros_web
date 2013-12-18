class TipoFiltrosController < ApplicationController
      before_filter :require_login
  # GET /tipo_filtros
  # GET /tipo_filtros.xml
  def index
    @tipo_filtros = TipoFiltro.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tipo_filtros }
    end
  end

  # GET /tipo_filtros/1
  # GET /tipo_filtros/1.xml
  def show
    @tipo_filtro = TipoFiltro.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tipo_filtro }
    end
  end

  # GET /tipo_filtros/new
  # GET /tipo_filtros/new.xml
  def new
    @tipo_filtro = TipoFiltro.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tipo_filtro }
    end
  end

  # GET /tipo_filtros/1/edit
  def edit
    @tipo_filtro = TipoFiltro.find(params[:id])
  end

  # POST /tipo_filtros
  # POST /tipo_filtros.xml
  def create
    @tipo_filtro = TipoFiltro.new(params[:tipo_filtro])

    respond_to do |format|
      if @tipo_filtro.save
        format.html { redirect_to(@tipo_filtro, :notice => 'TipoFiltro was successfully created.') }
        format.xml  { render :xml => @tipo_filtro, :status => :created, :location => @tipo_filtro }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tipo_filtro.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tipo_filtros/1
  # PUT /tipo_filtros/1.xml
  def update
    @tipo_filtro = TipoFiltro.find(params[:id])

    respond_to do |format|
      if @tipo_filtro.update_attributes(params[:tipo_filtro])
        format.html { redirect_to(@tipo_filtro, :notice => 'TipoFiltro was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tipo_filtro.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_filtros/1
  # DELETE /tipo_filtros/1.xml
  def destroy
    @tipo_filtro = TipoFiltro.find(params[:id])
    @tipo_filtro.destroy

    respond_to do |format|
      format.html { redirect_to(tipo_filtros_url) }
      format.xml  { head :ok }
    end
  end
end
