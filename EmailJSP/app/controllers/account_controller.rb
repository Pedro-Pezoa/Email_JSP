class AccountController < ApplicationController
  
  skip_before_action :verify_authenticity_token
  
  def new
    if request.method == "POST"
      # Faz umas coisinhas e redireciona
      redirect_back fallback_location: "/"
    end
  end
end
