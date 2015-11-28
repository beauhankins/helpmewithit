class Users::RegistrationsController < ApplicationController
  load_and_authorize_resource :class => false

  def moderate
    if params[:approved] == "false"
      @users = User.where(:approved => false)
    else
      @users = User.all
    end
  end

  def approve_user
  	user = User.find(params[:id])
    user.approved = true

    if user.save
      flash[:notice] = "#{user.email} approved"
    else
      flash[:alert] = "#{user.email} approval failure"
    end

    redirect_to :back
  end

end