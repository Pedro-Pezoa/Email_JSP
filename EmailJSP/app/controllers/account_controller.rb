class AccountController < ApplicationController
  
  skip_before_action :verify_authenticity_token
  
  def new
    if request.method == "POST"
      @user = User.create(user_params)
      session[:user] = @user  # will later used by the application
      redirect_to root_path   # should redirect to /emails
    end
  end

  def login 
    @user = User.find_by(user_params)
    if @user 
      session[:user] = @user  # will later used by the application
      redirect_to root_path   # should redirect to /emails
    else
      redirect_to root_path
    end
  end

  def user_params
    params[:user].permit(:nome, :senha)
  end
end
