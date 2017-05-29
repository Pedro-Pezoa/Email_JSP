class EmailsController < ApplicationController
  def index
    @email_id = email_id 
  end

  def inbox
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
