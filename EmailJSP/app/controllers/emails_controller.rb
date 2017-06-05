class EmailsController < ApplicationController

  skip_before_action :verify_authenticity_token 

  def index
    if session[:user_id]
      @user_id = session[:user_id]
      @user_name = User.find_by(id: session[:user_id]).nome
      @user_password = User.find_by(id: session[:user_id]).senha
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
    begin
      @email_id = email_id 
      @email = Email.find_by(id: @email_id)
      @email_address = @email.email
      @email_passwd = @email.senha
      user_name = @email_address.to_s().split("@").first
      
      Mail.defaults do
        retriever_method :pop3, :address    => "pop.gmail.com",
                         :port       => 995,
                         :user_name  => 'joseDoSudao',
                         :password   => 'superSenhaSecreta',
                         :enable_ssl => true
      end
      @emails = Mail.find(:what => :first, :count => 10, :order => :asc)
    rescue
      @exception = true
    end 
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

  def edit
    @email = Email.find_by(email: email_param(:email),
                           user_id: email_param(:user_id))

    @email.update(senha: email_param(:senha))
    if @email
      ret = true
    else
      ret = false
    end
    redirect_to "/emails/"
  end

  def show
    emails = Email.where(email: email_param(:email))
    unless @emails
      emails = []
    end
    redirect_to "/emails/"
  end

  def destroy
    Email.find_by(id: email_param(:id)).destroy
    redirect_to "/emails/"
  end

  def email_id
    email_param(:id)
  end

  def email_param(key)
    params[:email][key]
  end
  
  def email_params
    params[:email].permit(:email, :senha, :user_id)
  end

end
