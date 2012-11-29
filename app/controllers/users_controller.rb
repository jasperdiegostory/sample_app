class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
    @user = User.new(params[:user])
    puts @user.inspect
    if @user.save
    	flash[:success] = "Welcome to Jasper's Special App!"
      	redirect_to @user
    else
      render 'new'
    end
  end
end