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

  def edit
  end

  def edit_commit
    @user = User.find_by(id: session[:user_id])
    nome = user_param(:nome)
    senha = user_param(:senha)
    senhaConf = user_param(:senha)

    if senha == senhaConf
      @user.update(nome: user_param(:nome))
      @user.update(senha: user_param(:senha))

      if @user
        ret = true
      else
        ret = false
      end
    end
    redirect_to "/emails/"
  end

  def destroy
  end

  def user_param(key)
    params[:user][key]
  end

  def user_params
    params[:user].permit(:nome, :senha)
  end
end
