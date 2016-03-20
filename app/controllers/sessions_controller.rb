class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email].strip)
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = 'Login successfully'
      redirect_to messages_path
    else
      flash[:error] = 'Invalid email or password'
      render :new
    end
  end

  def callback
    if user = User.from_omniauth(env["omniauth.auth"])
      session[:user_id] = user.id
      redirect_to messages_path
    else
      # don't log user in
      redirect_to root_path
    end
  end

  def destroy
    flash[:success] = 'Logout successfully'
    session[:user_id] = nil
    redirect_to root_path
  end
end
