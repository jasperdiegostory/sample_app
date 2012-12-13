class ApplicationController < ActionController::Base #class ApplicationController inhering from Rails Class ActionController
  protect_from_forgery
  include SessionsHelper
end