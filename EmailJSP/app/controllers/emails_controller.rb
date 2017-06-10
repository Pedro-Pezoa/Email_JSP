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
    @email_id = email_param(:id)
    @email = Email.find_by(id: @email_id)
    nome = @email.email
    senha = @email.senha

    @comeco = 0
    @fim = 10
    
    if email_param(:prox)
      @comeco = email_param(:fim).to_i
      @fim = @comeco + 10
    end 

    else if email_param(:ant) && email_param(:comeco).to_i != 0
      @fim = email_param(:comeco).to_i
      @comeco = @fim - 10
    end 

    Mail.defaults do
      retriever_method :imap, 
                       :address  => "imap.gmail.com",
                       :port       => 993,
                       :user_name  => nome,
                       :password   => senha,
                       :enable_ssl => true
    end
    @mails = []
    @mails = Mail.find(:what => :last, :count => @fim, :order => :desc)[@comeco..@fim]
  end

  def sendEmail
    @email_id = email_param(:id)
    @email = Email.find_by(id: @email_id)
    nome = @email.email
    senha = @email.senha

    arquivo = email_param(:file)
    paraQuem = email_param(:paraQuem)
    assunto = email_param(:assunto)
    texto = email_param(:texto)

    Mail.defaults do
      delivery_method :smtp, 
                      :address              => "smtp.gmail.com",
                      :port                 => 587,
                      :user_name            => nome,
                      :password             => senha,
                      :authentication       => 'plain',
                      :enable_starttls_auto => true
    end

    unless arquivo.empty?
      vetor = arquivo.split(";")

      Mail.deliver do
        to paraQuem
        from nome
        subject assunto
        body texto + ""

        vetor.each do |file|
          add_file file + ""
        end
      end
    else
      Mail.deliver do
        to paraQuem
        from nome
        subject assunto
        body texto + ""
      end
    end
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
