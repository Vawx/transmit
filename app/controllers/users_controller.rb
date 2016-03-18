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
end