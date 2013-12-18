class UploadController < ApplicationController      

      before_filter :require_login, :except => [:file,:show,:fileNew,:showNew]

      def file
        @file = ListaPrecio.find(params[:id])
        type = @file.name.match(/xls/i) ? "application/xls" : "application/pdf"
        send_data(@file.data,        :filename=> @file.name,        :disposition=> "inline",:type => type)
      end
      def show
        if params and params[:id] and !params[:id].empty?
          @file = ListaPrecio.find(params[:id])
          #puts @file
          #puts @file.id.to_s + " "+  @file.name  
        else
          @file = ListaPrecio.first(:conditions=>{:password=>params[:key]})
        end
      end
      
      
      def get        
        @file = ListaPrecio.new
      end
      def save       
        @file = ListaPrecio.new(params[:lista_precio])
        @file.created_by = session[:user_id]
        @file.created_at = Time.now

        if @file.save
          redirect_to(:action=> 'show', :id=> @file.id)
        else
          puts "error de render"
        render(:action=> :get)
        end
      end

      def fileNew
        @file = Novedad.find(params[:id])
        send_data(@file.data,        :filename=> @file.name,        :disposition=> "inline",:type => "application/pdf")
      end
      def showNew
        if params and params[:id] and !params[:id].empty?
          @file = Novedad.first(params[:id])        
        else
          @file = Novedad.first(:order=>"id desc")
        end
      end
      
      
      def getNew       
        @file = Novedad.new
      end
      def saveNew       
        @file = Novedad.new(params[:novedad])
        @file.created_by = session[:user_id]
        @file.created_at = Time.now

        if @file.save
          redirect_to(:action=> 'showNew', :id=> @file.id)
        else
        render(:action=> :getNew)
        end
      end
 end