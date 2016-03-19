class MessagesController < ApplicationController
  define_method :new do
    @message = Message.new
    redirect :dashboard
  end
end