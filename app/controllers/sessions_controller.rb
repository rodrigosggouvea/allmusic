class SessionsController < ApplicationController

  def login
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_path, :notice => "login efetuado"
    else
      redirect_to root_path, :notice => "ERROU O LOGIN KCT"
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path, :notice => "VOCE SAIU DO SISTEMA"
  end  
end
