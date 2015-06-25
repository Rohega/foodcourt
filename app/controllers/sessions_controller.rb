class SessionsController < ApplicationController

  def create
	  auth = request.env["omniauth.auth"]
	  user = User.where(:provider => auth['provider'], 
	                    :uid => auth['uid']).first || User.create_with_omniauth(auth)
	  session[:user_id] = user.id
    if current_user.role?(:admin) || current_user.role?(:superadmin)
      redirect_to '/admin', :notice => "Signed in!"
    else
      redirect_to '/', :notice => "Signed in!"
    end
	  
  end

  def new
  	redirect_to '/auth/facebook/callback'
  end

  def destroy
  	reset_session
  	redirect_to '/', notice => 'Signed out'
  end

end
