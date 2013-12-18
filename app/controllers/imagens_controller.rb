class ImagensController < ApplicationController
      before_filter :require_login

  # GET /imagens
  # GET /imagens.xml
  def index
    @imagens = Imagen.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @imagens }
    end
  end

  # GET /imagens/1
  # GET /imagens/1.xml
  def show
    @imagen = Imagen.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @imagen }
    end
  end

  # GET /imagens/new
  # GET /imagens/new.xml
  def new
    @imagen = Imagen.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @imagen }
    end
  end

  # GET /imagens/1/edit
  def edit
    @imagen = Imagen.find(params[:id])
  end

  # POST /imagens
  # POST /imagens.xml
  def create
    @imagen = Imagen.new(params[:imagen])

    respond_to do |format|
      if @imagen.save
        format.html { redirect_to(@imagen, :notice => 'Imagen was successfully created.') }
        format.xml  { render :xml => @imagen, :status => :created, :location => @imagen }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @imagen.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /imagens/1
  # PUT /imagens/1.xml
  def update
    @imagen = Imagen.find(params[:id])

    respond_to do |format|
      if @imagen.update_attributes(params[:imagen])
        format.html { redirect_to(@imagen, :notice => 'Imagen was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @imagen.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /imagens/1
  # DELETE /imagens/1.xml
  def destroy
    @imagen = Imagen.find(params[:id])
    @imagen.destroy

    respond_to do |format|
      format.html { redirect_to(imagens_url) }
      format.xml  { head :ok }
    end
  end
end
