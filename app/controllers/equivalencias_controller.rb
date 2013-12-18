class EquivalenciasController < ApplicationController
      before_filter :require_login

  # GET /equivalencias
  # GET /equivalencias.xml
  def index
    @equivalencias = Equivalencia.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @equivalencias }
    end
  end

  # GET /equivalencias/1
  # GET /equivalencias/1.xml
  def show
    @equivalencia = Equivalencia.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @equivalencia }
    end
  end

  # GET /equivalencias/new
  # GET /equivalencias/new.xml
  def new
    @equivalencia = Equivalencia.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @equivalencia }
    end
  end

  # GET /equivalencias/1/edit
  def edit
    @equivalencia = Equivalencia.find(params[:id])
  end

  # POST /equivalencias
  # POST /equivalencias.xml
  def create
    @equivalencia = Equivalencia.new(params[:equivalencia])

    respond_to do |format|
      if @equivalencia.save
        format.html { redirect_to(@equivalencia, :notice => 'Equivalencia was successfully created.') }
        format.xml  { render :xml => @equivalencia, :status => :created, :location => @equivalencia }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @equivalencia.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /equivalencias/1
  # PUT /equivalencias/1.xml
  def update
    @equivalencia = Equivalencia.find(params[:id])

    respond_to do |format|
      if @equivalencia.update_attributes(params[:equivalencia])
        format.html { redirect_to(@equivalencia, :notice => 'Equivalencia was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @equivalencia.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /equivalencias/1
  # DELETE /equivalencias/1.xml
  def destroy
    @equivalencia = Equivalencia.find(params[:id])
    @equivalencia.destroy

    respond_to do |format|
      format.html { redirect_to(equivalencias_url) }
      format.xml  { head :ok }
    end
  end
end
