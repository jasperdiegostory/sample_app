module SessionsHelper

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def current_user?(user)
    user == current_user
  end

   def sign_in(user) #a new remember token is created everytime a user sign's in.
    cookies.permanent[:remember_token] = user.remember_token
    current_user = user
  end  
  
  def signed_in?
    !current_user.nil?
  end

  def sign_out #on sign out, the cookies are deleted and a new remember token is created. This is for security. (I kinda made this!)
    cookies.delete(:remember_token)
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default ) # session is provided by rails, and is like an instance of the cookies variable. The session expires upon browser close.
    session.delete(:return_to) 
  end

  def store_location
    session[:return_to] = request.url #request responds to method url. we use the request object to get the url that was requested by the non-signed in user.
  end

end