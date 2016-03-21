class UsersController < ApplicationController
  def index
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session['user_id'] = @user.id
      redirect_to messages_path
    else
      redirect_to root_path
    end
  end

  def edit
    @user = User.find(session['user_id'])

  end

  def update
    @user = User.find(session['user_id'])

    if @user.update_attributes(user_params)
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  end
end
