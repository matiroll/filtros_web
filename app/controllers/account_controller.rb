class AccountController < ApplicationController

def admin
  params
end
def out
  session[:user_id] = nil
  session[:current_user_id] = nil
  #flash[:notice] = "Se ha deslogueado correctamente."
  redirect_to root_url
end
def show
  if  session and session[:user_id]
    params
  else
    redirect_to ""
  end  
end
 
def create
  if request.post? and params[:user]
    @user = Usuario.new(params[:user])
 
    user = Usuario.find_by_user(@user.user)
 
    # If we found a user with that username and the password provided matches
    # the password on file for that user, we can login the user.
    if user and user.password==@user.password
      session[:user_id] = user.id
      session[:current_user_id] = user.id   
      user.last_login = Time.now
      user.save
 
      if user.admin?
        redirect_to :controller=>"backoffices" #:action=>"show"
      else
        redirect_to :controller=>"backoffices"
      end
    else
      reset_session
      flash[:notice] = "Sorry, no user was found with that username/password combination"
      redirect_to :action => "index"      
    end
  end
end
end