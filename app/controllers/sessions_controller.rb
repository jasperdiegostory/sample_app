class SessionsController < ApplicationController #class SessionsController inherting from Rails class ApplicationController

def new #function/method new
end

def create
  user = User.find_by_email(params[:session][:email].downcase)
   if user && user.authenticate(params[:session][:password])
      sign_in user 
      redirect_back_or user #redirects back to the stored location.
   else
      flash.now[:error] = 'Invalid email/password combination' #why flash now?
      render 'new' #show the new-erb page again
   end
end

def current_user
  @current_user ||= User.find_by_remember_token(cookies[:remember_token])
end

def current_user?(user)
  user == current_user
end

def destroy
	sign_out
	redirect_to root_url
end

end

