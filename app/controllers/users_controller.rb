class UsersController < ApplicationController #class UsersController inheriting from Rails class ApplicationController
  before_filter :signed_in_user, only: [:edit, :update]
  before_filter :correct_user,   only: [:edit, :update]

  def show #function/method show
    @user = User.find(params[:id]) #@user is an instance variable. Automatically available in views. We create the current insance of the user by looking up the users parameters based on their ID. This is identical to User.find(1).
  end

  def new
  	@user = User.new #new method on object User. When new is called, @user becomes the same as new user. User.new does not touch the database; it creates a user in memory
  end

  def create
    @user = User.new(params[:user]) #new method on object User. @user is defined as the parameters for the user symbol :user. A new instance variable @user is created with the parameters of the user. This is built to handle signup failure. params returns here a hash of hashes — 
    if @user.save #this saves the user to the model (database)
      sign_in @user 
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else #this handles signup failure
      render 'new' #this will happen if the fields cannot be validated 
  end
end

  def edit
  end

def update
    if @user.update_attributes(params[:user]) #@user instance variable has method update_attributes with argument parameters of users (params[:user]) returns the parameters of the user. This is actually creating an instance of the user class.
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
  end
end

private

    def signed_in_user # function signed_in_user
      unless signed_in? #boolean response: yes or no answer. unless means run only if not true
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

#if signed_in? is not true – i.e. if the user is not signed in, then redirect to signin URL.

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
  end