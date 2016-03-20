class MessagesController < ApplicationController
  before_filter :set_user
  def index
    @messages = Message.where("recipient LIKE (?)", "#{@user.id}")

  end

  def new
    @message = @user.messages.build
    @friends = @user.friend
  end

  def create
    @message = @user.messages.build(message_params)
    if @message.save
      redirect_to messages_path
    else
      flash[:error] = 'Invalid email or password'
      render :new
    end
  end

  def show_sent
    @messages = @user.messages.order('created_at DESC')
  end

  def show_message
    @message = Message.find(params[:id])
    if !@message.is_read && @message.user_id != @user.id
      if @message.update_attributes(is_read:true)
        flash[:message] = 'You have read the message'
      end
    end
    @recipients = User.find(@message.recipient.split(","))
  end

  private
  def set_user
    #@user ||= User.find(params[:user_id])

    @user ||= User.find(session[:user_id]) if session[:user_id]
    if @user == nil
      redirect_to '/'
    end
  end

  def message_params
    params.require(:message).permit(:content, :recipient)
  end
end
