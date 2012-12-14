class UsersController < ApplicationController #class UsersController inheriting from Rails class ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update] # this method is called before anything specified, here edit and update. this prevents non-signed in people from editing and updating users, or from seeing the all-user index.
  before_filter :correct_user,   only: [:edit, :update] # this is similar to above.

  def show #function/method show
    @user = User.find(params[:id]) #@user is an instance variable. Automatically available in views. We create the current insance of the user by looking up the users parameters based on their ID. This is identical to User.find(1) for user(1).
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
      puts "LOOOK AT ME HERE"
    else #this handles signup failure
      render 'new' #this will happen if the fields cannot be validated 
  end
end

def index #user index for "all users"
  @users = User.all
end

def edit #this just renders the edit.html.erb file. The update is the actual process; edit the page.
end

def update
  @user = User.find(params[:id])
    if @user.update_attributes(params[:user]) #@user instance variable has method update_attributes with argument parameters of users (params[:user]) returns the parameters of the user. This is actually creating an instance of the user class. 
      flash[:success] = "Profile updated"
      sign_in @user #we need to sign in the user as part of the profile update because the remember token gets reset when the user is saved
      redirect_to @user
    else
      render 'edit' #if it doesn't work for whatever reason, it returns the user to the edit page.
  end
end

private

    def signed_in_user # function signed_in_user
      unless signed_in? #boolean response: yes or no answer. unless means run only if not true. So unless they are signed in, the following happens
        store_location # this is cool. I think this is so that after they've signed in, they go to original location they were trying to access.
        redirect_to signin_url, notice: "Please sign in." # users are redirected to the signing page and told to sign in. The notice: is the same as flash[:notice] = "Please sign in". Notice is the third type alongside success and error flashes in bootstrap css.
      end
    end

    def correct_user # this makes sure that the user is the correct user.
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
  end