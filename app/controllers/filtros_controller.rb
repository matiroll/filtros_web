class FiltrosController < ApplicationController
    before_filter :require_login
  # GET /filtros
  # GET /filtros.xml
  def index
    @filtros = Filtro.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @filtros }
    end
  end

  # GET /filtros/1
  # GET /filtros/1.xml
  def show
    @filtro = Filtro.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @filtro }
    end
  end

  # GET /filtros/new
  # GET /filtros/new.xml
  def new
    @filtro = Filtro.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @filtro }
    end
  end

  # GET /filtros/1/edit
  def edit
    @filtro = Filtro.find(params[:id])
  end

  # POST /filtros
  # POST /filtros.xml
  def create
    @filtro = Filtro.new(params[:filtro])

    respond_to do |format|
      if @filtro.save
        format.html { redirect_to(@filtro, :notice => 'Filtro was successfully created.') }
        format.xml  { render :xml => @filtro, :status => :created, :location => @filtro }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @filtro.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /filtros/1
  # PUT /filtros/1.xml
  def update
    @filtro = Filtro.find(params[:id])

    respond_to do |format|
      if @filtro.update_attributes(params[:filtro])
        format.html { redirect_to(@filtro, :notice => 'Filtro was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @filtro.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /filtros/1
  # DELETE /filtros/1.xml
  def destroy
    @filtro = Filtro.find(params[:id])
    @filtro.destroy

    respond_to do |format|
      format.html { redirect_to(filtros_url) }
      format.xml  { head :ok }
    end
  end
end
