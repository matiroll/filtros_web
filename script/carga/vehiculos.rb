require 'hpricot'
require 'active_record'
require 'json'

       ActiveRecord::Base.establish_connection(
        :adapter  => "mysql",
        :host     => "localhost",
        :username => "root",
        :password => "despegar",
        :database => "mc001055_hasting"
      )  

 class Vehiculo < ActiveRecord::Base  
    self.table_name =  'vehiculos'
  end
 def desde(string)
   res=""
   puts "String " + string
   if string.match(/(.+)-(.+)/i)     
     res= string.match(/(.+)-(.+)/i)[1]  
   elsif string.match(/(.+) AL (.+)/i)     
     res= string.match(/(.+) AL (.+)/i)[1]      
   elsif string.match(/(.+)\/(.+)\>/i)
     res= string.match(/(.+)\/(.+)\>/i)[1] + "/" + string.match(/(.+)\/(.+)\>/i)[2]
   elsif string.match(/(.+)\>/i)
     res= string.match(/(.+)\>/i)[1]
   elsif string.match(/(.+)\//i)
     res= string.match(/(.+)\//i)[1]   
   elsif string.match(/^\d\d$/i)
    res=string
  end
  puts "DESDE " + res
   return res  
 end
  def hasta(string)
    res=""
   puts "String " + string
    
   if string.match(/(.+)-(.+)/i)     
     res= string.match(/(.+)-(.+)/i)[2] 
   elsif string.match(/(.+) AL (.+)/i)     
     res= string.match(/(.+) AL (.+)/i)[2]      
   elsif string.match(/\>(.+)\/(.+)/i)
     res= string.match(/\>(.+)\/(.+)/i)[1] + "/" + string.match(/\>(.+)\/(.+)/i)[2]       
   elsif string.match(/\>(.+)/i)
     res= string.match(/\>(.+)/i)[1]
   elsif string.match(/\/(.+)/i)
     res= string.match(/\/(.+)/i)[1]
   elsif string.match(/^\d\d$/i)
    res=string
  end
  puts "HASTA " + res
  
   return res   
 end  
  class Filtro < ActiveRecord::Base  
    self.table_name =  'filtros'
  end
 class FiltroVehiculo < ActiveRecord::Base  
    self.table_name =  'filtro_vehiculos'
  end   
   
   filename = 'vehiculo_fil7.csv'
   file = File.new(filename, 'r')
   
   file.each_line("\n") do |row|
    columns = row.split(",")
     
     test2 = Vehiculo.new(:modelo=>columns[1].strip,:desde=>desde(columns[2].strip),:hasta=>hasta(columns[2].strip),:marca=>columns[0].strip,:tipo=>9,:creaated_at=>Time.now,:updated_at=>Time.now)
     test2.save
    end
  
   # filename = 'vehiculo_fil7.csv'
   # file = File.new(filename, 'r')
#    
   # file.each_line("\n") do |row|
   # begin
     # columns = row.split(",")
#      
     # test = Vehiculo.first(:conditions=>{:modelo=>columns[0].strip})
# 
      # 1.upto(columns.length-1) do |ind|
        # if !columns[ind].strip.empty?
          # filtro_enc = Filtro.first(:conditions=>{:codigo=>columns[ind].strip})
          # if filtro_enc
          # test2 = FiltroVehiculo.new(:vehiculo=>test.id,:filtro=>filtro_enc.id,:created_at=>Time.now,:updated_at=>Time.now)
          # test2.save    
          # else            
            # if columns[ind].match(/\((.*)\)/i)
              # if columns[ind].match(/\((.*)\)/i)[1]=="CS" or columns[ind].match(/\((.*)\)/i)[1]=="SS" or columns[ind].match(/\((.*)\)/i)[1]=="S/V" or columns[ind].match(/\((.*)\)/i)[1]=="SC" or columns[ind].match(/\((.*)\)/i)[1]=="TA"
                # filtro_enc = Filtro.first(:conditions=>{:codigo=>columns[ind].strip.match(/(.*)\((CS|SS|S\/V|SC|TA)/)[1].strip,:tipo=>2})
              # end
              # if columns[ind].match(/\((.*)\)/i)[1]=="CD" or columns[ind].match(/\((.*)\)/i)[1]=="PA" or columns[ind].match(/\((.*)\)/i)[1]=="PF" or columns[ind].match(/\((.*)\)/i)[1]=="CO"
                # filtro_enc = Filtro.first(:conditions=>{:codigo=>columns[ind].strip.match(/(.*)\((CD|PA|PF|CO)/)[1].strip,:tipo=>4})
              # end
              # if columns[ind].match(/\((.*)\)/i)[1]=="DH" or columns[ind].match(/\((.*)\)/i)[1]=="CP"  or columns[ind].match(/\((.*)\)/i)[1]=="HI"  or columns[ind].match(/\((.*)\)/i)[1]=="TH"
                # filtro_enc = Filtro.first(:conditions=>{:codigo=>columns[ind].strip.match(/(.*)\((CP|DH|HI|TH)/)[1].strip,:tipo=>7})
              # end 
              # if !filtro_enc and columns[ind].strip.match(/(.*)\(/)
                # filtro_enc = Filtro.first(:conditions=>{:codigo=>columns[ind].strip.match(/(.*)\(/)[1].strip})
              # end                     
              # if !filtro_enc and columns[ind].strip.match(/\)(.+)\(/)
                # filtro_enc = Filtro.first(:conditions=>{:codigo=>columns[ind].strip.match(/\)(.+)\(/)[1].strip})
              # end    
              # if !filtro_enc and columns[ind].strip.match(/\)(.+)/)
                # filtro_enc = Filtro.first(:conditions=>{:codigo=>columns[ind].strip.match(/\)(.*)/)[1].strip})
              # end     
              # if filtro_enc
                  # test2 = FiltroVehiculo.new(:vehiculo=>test.id,:filtro=>filtro_enc.id,:created_at=>Time.now,:updated_at=>Time.now)
                  # test2.save
               # else
                 # puts columns[ind]
                  # columns[ind]
              # end                
            # end
          # end
        # end
      # end
# 
   # rescue=> e
    # puts e
   # end
 # end 