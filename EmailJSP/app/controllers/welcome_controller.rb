class WelcomeController < ApplicationController
  def index
    if session[:user_id]
      redirect_to "/emails/"
    end
  end 
end
