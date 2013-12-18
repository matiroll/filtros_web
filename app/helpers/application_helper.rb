# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def link_to_login
   if session and session[:user_id]
     return link_to "Desloguearse", "/account/out", :method=>:post
   else  
     return link_to "Registrarse", "/account"
   end   
 end
   def link_to_backoffice
   if session and session[:user_id]
     return "<li><a href='/backoffices'>Backoffice<span class='flecha'>&#9660;</span></a></li>"
   end   
  end  
   def randHeadSize
    inte=rand(7)
    if inte==6
      inte=7
    end
    inte.to_s 
  end 
end
