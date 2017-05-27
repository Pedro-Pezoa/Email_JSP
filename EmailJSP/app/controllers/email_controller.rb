class EmailController < ApplicationController

  skip_before_action :verify_authenticity_token
  
  def new
    @email = Email.create(email_params)
    if @email
      ret = {:email => @email.email, :id => @email.user_id}
    else
      ret = {}
    end
    respond_json ret
  end

  def show
    @email = Email.find_by(email: email_param(:email),
                           user_id: email_param(:user_id))
    if @email
      ret = true
    else
      ret = false
    end
    respond_json ret
  end


  def edit
    @email = Email.find_by(email: email_param(:email),
                           user_id: email_param(:user_id))
    @email.update(senha: email_param(:nsenha))
    if @email
      ret = true
    else
      ret = false
    end
    respond_json ret
  end

  def destroy
    @email = Email.find_by(email: email_param(:email),
                           user_id: email_param(:user_id))
    if @email   
      @email.destroy
      respond_json true
    else
      respond_json false
    end
  end

  def email_param(key)
    params[:email][key]
  end
  
  def email_params
    params[:email].permit(:email, :senha, :user_id)
  end

  def respond_json(obj)
    respond_to do |format|
      format.json  { render :json => obj}
    end
  end
end
