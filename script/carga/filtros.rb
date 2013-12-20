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
  
   filename = 'filtros.csv'
   file = File.new(filename, 'r')
   
   file.each_line("\n") do |row|
   begin
     columns = row.split(",")
     

     test = Filtro.new(:codigo =>columns[0],"diametro_exterior A" => columns[1],"diametro_interior A"=>columns[2],:altura=>columns[3],:tipo=>10,:created_at=>Time.now,:updated_at=>Time.now)
     test.save   
   rescue=> e
    puts e
   end
    end  