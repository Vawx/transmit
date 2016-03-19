require './lib/assets/modbotmain'

class UsersController < ApplicationController
  define_method :index do
    render :index
  end

  define_method :show do
    if params[:id] == "about"
      render :about
    elsif params[:id] == "support"
      render :support
    elsif params[:id] == "dashboard"
      render :dashboard
    end
  end

  define_method :new do
    @user = User.new
    render :new
  end

  define_method :create do
    @user = User.new user_params
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  define_method :read do |message|
    puts message
  end

private
  define_method :user_params do
    params.require( :user ).permit( :name, :email, :password )
  end
end