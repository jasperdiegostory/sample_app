class StaticPagesController < ApplicationController #class StaticPagesController inheriting from Rails class ApplicationController
  
  def home #function/method home
  end

#these methods look like they would do nothing. But because of the inheritance from ApplicationController, when someone visits URI/static_pages/home (from routes.rb), Rails looks in StaticPages controller (because it says static_pages#home) and renders the view corresponding to the action ("xyz" action has view xyz.html.erb".


  def help
  end

  def about
  end

  def contact
  end
  
end
