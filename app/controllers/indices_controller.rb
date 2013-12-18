class IndicesController < ApplicationController
  # GET /indices
  # GET /indices.xml
  def index
#    @indices = Index.all
#
#    respond_to do |format|
#      format.html # index.html.erb
#      format.xml  { render :xml => @indices }
#    end
  end

  # GET /indices/1
  # GET /indices/1.xml
  def show
    @index = Index.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @index }
    end
  end

  # GET /indices/new
  # GET /indices/new.xml
  def new
    @index = Index.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @index }
    end
  end

  # GET /indices/1/edit
  def edit
    @index = Index.find(params[:id])
  end

  # POST /indices
  # POST /indices.xml
  def create
    @index = Index.new(params[:index])

    respond_to do |format|
      if @index.save
        format.html { redirect_to(@index, :notice => 'Index was successfully created.') }
        format.xml  { render :xml => @index, :status => :created, :location => @index }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @index.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /indices/1
  # PUT /indices/1.xml
  def update
    @index = Index.find(params[:id])

    respond_to do |format|
      if @index.update_attributes(params[:index])
        format.html { redirect_to(@index, :notice => 'Index was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @index.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /indices/1
  # DELETE /indices/1.xml
  def destroy
    @index = Index.find(params[:id])
    @index.destroy

    respond_to do |format|
      format.html { redirect_to(indices_url) }
      format.xml  { head :ok }
    end
  end
  def contacto   
    if params and params[:contacto] and params[:contacto][:nombre]
      email=params[:contacto][:email]
      asunto=params[:contacto][:asunto]
      mensaje=params[:contacto][:mensaje]
      nombre=params[:contacto][:nombre]     
     mail = Mail.new do
        from     nombre + " <" + email + ">"
        to       'contacto@hastingfiltros.com.ar'
        subject  asunto
        #'Here is the image you wanted'
        #content_type 'text/html; charset=UTF-8'
        body     mensaje
      end
      
      mail.delivery_method :smtp ,{ :address     => "mail.hastingfiltros.com.ar",
                           :port                 => 25,
                           :domain               => 'hastingfiltros.com.ar',
                           :user_name            => "website@hastingfiltros.com.ar",
                           :password             => "Website777",
                           :authentication       => :login,
                           :enable_starttls_auto => false  }
      mail.deliver!    
    
      flash[:notice] = "Su mensaje ha sido enviado, gracias por comunicarse"
    end
  end
  def catalogo_online
   filter_data
 end
  
  def filter_data
    @tipo_vehiculos = TipoVehiculo.find(:all, {:order => "nombre asc"})
    @tipo_filtros = TipoFiltro.find(:all, {:order => "nombre asc"},:conditions=>"id <> 10")
    @filtros_cod = Filtro.find(:all, {:order => "codigo asc"})
    
    @marcas_eq_map=Hash.new
    equivalencia=Equivalencia.find(:all,:select=>"distinct marca")

   if equivalencia.length > 0
      marcas= MarcaVehiculo.find(:all,:conditions=>"id in (" + equivalencia.map{|a| a.marca}.join(",") + ")",:order=>"nombre asc")  
      marcas.each do |a_brand|
        @marcas_eq_map[a_brand.nombre]=a_brand.id
      end
    end
  end
  
  def tipo_vehiculo
   filter_data
    
   @tipo_vehiculo= TipoVehiculo.find(params[:id])
   @vehiculos=Vehiculo.find(:all,:select=>"distinct marca",:conditions=>"tipo = " + params[:id])
   @marcas_map=Hash.new
   
   if @vehiculos.length > 0
      marcas= MarcaVehiculo.find(:all,:conditions=>"id in (" + @vehiculos.map{|a| a.marca}.join(",") + ")",:order=>"nombre asc")  
      marcas.each do |a_brand|
        @marcas_map[a_brand.nombre]=a_brand.id
      end
    end
  end
  def auto_complete_for_message_to()  
    user_name = params[:message][:to]  
    @customers = ["aaa","bbbb"]#Customer.find(:all , :conditions=>"name like              '%"+user_name.downcase+"%'")  
    render :partial => 'username'  
  end  
  def marca_vehiculo
   filter_data
    
    if !params[:brand_v]
      params[:brand_v]=params[:id]
    end
   vehiculos=Vehiculo.find(:all,:conditions=>"marca = " + (params[:brand_v]),:order=>"modelo asc")
   @marca_vehiculo= MarcaVehiculo.find(params[:brand_v],:order=>"nombre asc")
   @tipo_vehiculo= TipoVehiculo.find(params[:type_v])
   
  @vehiculos_map=Hash.new

   vehiculos.each do |a_brand|
     @vehiculos_map[a_brand.modelo]=a_brand.id
   end
  end
  def modelo_vehiculo
   filter_data
   
    if !params[:model_v]
      params[:model_v]=params[:id]
    end   
    
   @modelo_vehiculo=Vehiculo.find(params[:model_v])
   @marca_vehiculo= MarcaVehiculo.find(params[:brand_v],:order=>"nombre asc")
   @tipo_vehiculo= TipoVehiculo.find(params[:type_v])
   tipos_filtros= TipoFiltro.find(:all)
   
   filtro_vehiculo=FiltroVehiculo.find(:all,:select=>:filtro,:conditions=>"vehiculo = " + params[:model_v]).map { |e| e.filtro }
   if filtro_vehiculo.length > 0
    @filtros = Filtro.find(:all,:conditions=>"id in (#{filtro_vehiculo.join(",")})",:order=>"codigo asc")
   else
    @filtros=[] 
   end
   @tipos_map=Hash.new

   tipos_filtros.each do |a_brand|
     @tipos_map[a_brand.id.to_s]=a_brand.nombre + " " + (a_brand.nivel||"") 
   end
 end
  def filtro
   filter_data
   
    if !params[:filtro]
      params[:filtro]=params[:id]
    end   
    
   @modelo_vehiculo=Vehiculo.find(params[:model_v])
   @marca_vehiculo= MarcaVehiculo.find(params[:brand_v],:order=>"nombre asc")
   @tipo_vehiculo= TipoVehiculo.find(params[:type_v])
   
   filtro_vehiculo=FiltroVehiculo.find(:all,:select=>:filtro,:conditions=>"vehiculo = " + params[:model_v]).map { |e| e.filtro }
   
   @filtro = Filtro.find(params[:filtro])
   @tipo_filtro= TipoFiltro.find(@filtro.tipo)

   aplicaciones=FiltroVehiculo.find(:all,:select=>:vehiculo,:conditions=>"filtro = " + params[:filtro]).map { |e| e.vehiculo }
   @aplicaciones_map=Hash.new

   aplicaciones.each do |a_aplic|
     modelo_vehiculo=Vehiculo.find(a_aplic)
     
     marca= MarcaVehiculo.find(modelo_vehiculo.marca,:order=>"nombre asc")
     @aplicaciones_map["/indices/modelo_vehiculo/"+modelo_vehiculo.id.to_s+"?type_v="+modelo_vehiculo.tipo.to_s+"&brand_v="+modelo_vehiculo.marca.to_s]=     marca.nombre + " " + (modelo_vehiculo.modelo||"") + " " + (modelo_vehiculo.desde && !modelo_vehiculo.desde.empty? ? "Desde #{modelo_vehiculo.desde}" : "") + " " + (modelo_vehiculo.hasta && !modelo_vehiculo.hasta.empty? ? "Hasta #{modelo_vehiculo.hasta}" : "")
   end
   alternativos = Alternativo.find(:all,:conditions=>"primario=#{params[:filtro]} or secundario=#{params[:filtro]}")
   @alternativos_map=Hash.new

   alternativos.each do |a_alter|
     if a_alter.primario.to_s==params[:filtro].to_s and a_alter.secundario 
       filtro = Filtro.find(a_alter.secundario)
       @alternativos_map["/indices/filtro_alt/#{a_alter.secundario}"]="Secundario #{filtro.codigo}"            
     elsif a_alter.secundario.to_s==params[:filtro].to_s and a_alter.primario 
       filtro = Filtro.find(a_alter.primario)
       @alternativos_map["/indices/filtro_alt/#{a_alter.primario}"]="Primario #{filtro.codigo}"            
     end
   end
   equivalencias = Equivalencia.find(:all,:conditions=>"filtro = " + params[:filtro])
   @equivalencias_map=Array.new
   equivalencias.each do |a_equi|
     marca=MarcaVehiculo.find(a_equi.marca,:order=>"nombre asc")
     @equivalencias_map<<marca.nombre.to_s + " " + a_equi.codigo.to_s
   end   
 end
  def filtro_alt
   filter_data
   
    if !params[:filtro]
      params[:filtro]=params[:id]
    end   
        
   @filtro = Filtro.find(params[:filtro])
   @tipo_filtro= TipoFiltro.find(@filtro.tipo)

   aplicaciones=FiltroVehiculo.find(:all,:select=>:vehiculo,:conditions=>"filtro = " + params[:filtro]).map { |e| e.vehiculo }
   @aplicaciones_map=Hash.new

   aplicaciones.each do |a_aplic|
     modelo_vehiculo=Vehiculo.find(a_aplic)
     
     marca= MarcaVehiculo.find(modelo_vehiculo.marca,:order=>"nombre asc")
     @aplicaciones_map["/indices/modelo_vehiculo/"+modelo_vehiculo.id.to_s+"?type_v="+modelo_vehiculo.tipo.to_s+"&brand_v="+modelo_vehiculo.marca.to_s]=     marca.nombre + " " + (modelo_vehiculo.modelo||"") + " " + (modelo_vehiculo.desde && !modelo_vehiculo.desde.empty? ? "Desde #{modelo_vehiculo.desde}" : "") + " " + (modelo_vehiculo.hasta && !modelo_vehiculo.hasta.empty? ? "Hasta #{modelo_vehiculo.hasta}" : "")
   end
   alternativos = Alternativo.find(:all,:conditions=>"primario=#{params[:filtro]} or secundario=#{params[:filtro]}")
   @alternativos_map=Hash.new

   alternativos.each do |a_alter|
     if a_alter.primario.to_s==params[:filtro].to_s
       filtro = Filtro.find(a_alter.secundario)
       @alternativos_map["/indices/filtro_alt/#{a_alter.secundario}"]="Secundario #{filtro.codigo}"            
     else
       filtro = Filtro.find(a_alter.primario)
       @alternativos_map["/indices/filtro_alt/#{a_alter.primario}"]="Primario #{filtro.codigo}"            
     end
   end
   equivalencias = Equivalencia.find(:all,:conditions=>"filtro = " + params[:filtro])
   @equivalencias_map=Array.new
   equivalencias.each do |a_equi|
     marca=MarcaVehiculo.find(a_equi.marca,:order=>"nombre asc")
     @equivalencias_map<<marca.nombre.to_s + " " + a_equi.codigo.to_s
   end
 end 
  def filtros_tipo
   filter_data
    
   tipos_filtros= TipoFiltro.find(:all)
   
    @filtros = Filtro.find(:all,:conditions=>"tipo = #{params[:id]}",:order=>"codigo asc")

    @tipos_map=Hash.new

   tipos_filtros.each do |a_brand|
     @tipos_map[a_brand.id.to_s]=a_brand.nombre + " " + (a_brand.nivel||"") 
 end 
  end
  
  def marca_equivalencia
   filter_data
    
    if !params[:brand_eq_v]
      params[:brand_eq_v]=params[:id]
    end
   equivalencias=Equivalencia.find(:all,:conditions=>"marca = " + (params[:brand_eq_v]) + " and filtro is not null",:order=>"codigo asc")
   marca_vehiculo= MarcaVehiculo.find(params[:brand_eq_v],:order=>"nombre asc")
   
    @equivalencias_map=Hash.new

   equivalencias.each do |a_brand|
     filtros = Filtro.find(:first,:conditions=>"id = #{a_brand.filtro}")

     @equivalencias_map["/indices/filtro_alt/#{a_brand.filtro}"]=marca_vehiculo.nombre + "  " + a_brand.codigo + "  |  " + "HASTING " + filtros.codigo
   end
  end
  
end