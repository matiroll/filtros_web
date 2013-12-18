class BackofficesController < ApplicationController
    before_filter :require_login
  
  def index
   @lista_precios = ListaPrecio.find(:all,:order=>"id desc")
   if @user
        flash[:notice] = "You're logged in"
        redirect_to root_url
      else
        render :action => "index"
   end    
  end
end