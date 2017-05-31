class EmailsController < ApplicationController

  skip_before_action :verify_authenticity_token 

  def index
    if session[:user_id]
      @user_name = User.find_by(id: session[:user_id]).nome
      @emails = Email.where(user_id: session[:user_id])

    unless @emails
      @emails = []
    end

    else
      redirect_to "/"
    end
  end

  def inbox
    @email_id = email_id
  end

  def profile
  end

  def profile_commit
  end

  def exit
    session.delete(:user_id)
    redirect_to "/"
  end

  def email_id
    params[:id]
  end
  
end
