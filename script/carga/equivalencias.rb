require 'hpricot'
require 'active_record'
require 'json'

       ActiveRecord::Base.establish_connection(
        :adapter  => "mysql",
        :host     => "localhost",
        :username => "root",
        :password => "",
        :database => "filtros_web_development"
      )  

  class Filtro < ActiveRecord::Base  
    self.table_name =  'filtros'
  end
 class Equivalencia < ActiveRecord::Base  
    self.table_name =  'equivalencias'
  end   
   
   filename = 'filtros.csv'
   file = File.new(filename, 'r')
   
   file.each_line("\n") do |row|
   begin
     columns = row.split(",")
     columns = row.split("\;")

      ind = 2
        if !columns[ind].strip.empty?
          filtro_enc = Filtro.first(:conditions=>{:codigo=>columns[ind].strip})
          if filtro_enc
                  filtro =filtro_enc.id
          else            
            if columns[ind].match(/\((.*)\)/i)
              if columns[ind].match(/\((.*)\)/i)[1]=="CS" or columns[ind].match(/\((.*)\)/i)[1]=="SS" or columns[ind].match(/\((.*)\)/i)[1]=="S/V" or columns[ind].match(/\((.*)\)/i)[1]=="SC" or columns[ind].match(/\((.*)\)/i)[1]=="TA"
                filtro_enc = Filtro.first(:conditions=>{:codigo=>columns[ind].strip.match(/(.*)\((CS|SS|S\/V|SC|TA)/)[1].strip,:tipo=>2})
              end
              if columns[ind].match(/\((.*)\)/i)[1]=="CD" or columns[ind].match(/\((.*)\)/i)[1]=="PA" or columns[ind].match(/\((.*)\)/i)[1]=="PF" or columns[ind].match(/\((.*)\)/i)[1]=="CO"
                filtro_enc = Filtro.first(:conditions=>{:codigo=>columns[ind].strip.match(/(.*)\((CD|PA|PF|CO)/)[1].strip,:tipo=>4})
              end
              if columns[ind].match(/\((.*)\)/i)[1]=="DH" or columns[ind].match(/\((.*)\)/i)[1]=="CP"  or columns[ind].match(/\((.*)\)/i)[1]=="HI"  or columns[ind].match(/\((.*)\)/i)[1]=="TH"
                filtro_enc = Filtro.first(:conditions=>{:codigo=>columns[ind].strip.match(/(.*)\((CP|DH|HI|TH)/)[1].strip,:tipo=>7})
              end 
              if !filtro_enc and columns[ind].strip.match(/(.*)\(/)
                filtro_enc = Filtro.first(:conditions=>{:codigo=>columns[ind].strip.match(/(.*)\(/)[1].strip})
              end                     
              if !filtro_enc and columns[ind].strip.match(/\)(.+)\(/)
                filtro_enc = Filtro.first(:conditions=>{:codigo=>columns[ind].strip.match(/\)(.+)\(/)[1].strip})
              end    
              if !filtro_enc and columns[ind].strip.match(/\)(.+)/)
                filtro_enc = Filtro.first(:conditions=>{:codigo=>columns[ind].strip.match(/\)(.*)/)[1].strip})
              end     
              if filtro_enc
                  filtro=filtro_enc.id
               else
                 puts columns[ind]
                  columns[ind]
              end                
            end
        end
    end
    
    test2 = Equivalencia.new(:codigo=>columns[1],:filtro=>filtro,:marca=>columns[0],:created_at=>Time.now,:updated_at=>Time.now)
    test2.save
   rescue=> e
    puts e
   end
 end 