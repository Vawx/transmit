class ContactsController < ApplicationController

  define_method :index do
    binding.pry
  end

  define_method :show do
    if params[:id] == 'contact'
      @contact = Contact.new
      render :contact
    end
  end

  define_method :create do

  end

  private
  define_method :contacts_params do

  end
end