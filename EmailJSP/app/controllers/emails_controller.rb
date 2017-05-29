class EmailsController < ApplicationController
  def index 
  end

  def inbox
    @email_id = email_id
  end

  def profile
  end

  def profile_commit
  end

  def exit
  end

  def email_id
    params[:id]
  end
  
end
