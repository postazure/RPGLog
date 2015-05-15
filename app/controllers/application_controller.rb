class ApplicationController < ActionController::Base
  require 'pp'
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def mp *splat
    puts "#"*50
    splat.each do |item|
      pp item
    end
    puts "#"*50
  end
end
