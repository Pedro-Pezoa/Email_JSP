class AccountController < ApplicationController
  
  skip_before_action :verify_authenticity_token
  
  def new 
  end

  def new_commit 
    @user = User.create(user_params)
    session[:user_id] = @user.id  # will later used by the application
    redirect_to root_path         # should redirect to /emails 
  end


  def login 
    @user = User.find_by(user_params)
    if @user 
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def user_params
    params[:user].permit(:nome, :senha)
  end
end
