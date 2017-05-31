class UserController < ApplicationController

  skip_before_action :verify_authenticity_token
  
  def new
    @user = User.create(user_params)
    if @user
      ret = {:nome => @user.nome, :id => @user.id}
    else
      ret = {}
    end
    respond_json ret
  end

  def show
    @user = User.find_by(user_params)
    if @user
      ret = {:nome => @user.nome, :id => @user.id}
    else
      ret = {}
    end
    respond_json ret
  end

  def edit
    @user = User.find_by(user_params)
    @user.update(senha: params[:user][:nsenha])
    if @user
      ret = true
    else
      ret = false
    end
    respond_json ret
  end

  def destroy
    @user = User.find_by(user_params)
    if @user   
      @user.destroy
      respond_json true
    else
      respond_json false
    end
  end

  def user_params
    params[:user].permit(:nome, :senha)
  end

  def respond_json(obj)
    respond_to do |format|
      format.json  { render :json => obj}
    end
  end
end
