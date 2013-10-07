class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to posts_path
    else
      flash.now.alert = "fuck off and get your email straight!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to posts_path
  end

  def new
  end

end
