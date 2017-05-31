class EmailsController < ApplicationController

  skip_before_action :verify_authenticity_token 

  def index
    if session[:user_id]
      @user_name = User.find_by(id: session[:user_id]).nome
      if params[:email]
        if params[:email][:email]
          unless params[:email][:email].empty?
             @emails = Email.where(email: email_param(:email))
           else
            @emails = Email.where(user_id: session[:user_id])
           end
         end
       

      else
        @emails = Email.where(user_id: session[:user_id])

        unless @emails
          @emails = []
        end
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

  def new
    Email.create(email_params)
    redirect_to "/emails/"
  end

  def show
    emails = Email.where(email: email_param(:email))
    unless @emails
      emails = []
    end
    session[:emails] =
    redirect_to "/emails/"
  end

  def destroy
    @email = Email.find_by(id: email_param(:id))   
    @email.destroy
    redirect_to "/emails/"
  end

  def email_id
    params[:id]
  end

  def email_param(key)
    params[:email][key]
  end
  
  def email_params
    params[:email].permit(:email, :senha, :user_id)
  end

end
