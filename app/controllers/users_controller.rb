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
    elsif params[:id]. == "dashboard"
      Thread.new do
        ModBotMain.new self
      end
      @message = "Welcome!"
      render :dashboard
    elsif params[:id] == "login"
      @user = User.new
      render :login
    end
  end

  define_method :new do
    @user = User.new
    render :new
  end

  define_method :create do
    if params[:user][:name].class == NilClass
      @users = User.all
      @users. each do |u|
        if u.email == params[:user][:email]
          if u.password == params[:user][:password]
            @message = "Welcome!"
            redirect_to user_path( "dashboard" )
            return
          end
        end
      end
      @user = User.new
      render :new
    else
      @user = User.new user_params
      if @user.save
        redirect_to users_path
      else
        render :new
      end
    end
  end

  define_method :read do |message|
    puts "CONTROLLER:" + message
    @message = Message.new
    @message.from = "test"
    @message.message = message
    puts "NEW MESSAGE " + @message.message
    message_path( @message )
  end

private
  define_method :user_params do
    params.require( :user ).permit( :name, :email, :password )
  end

  define_method :user_login_params do
    params.require( :user ).permit( :email, :password )
  end
end