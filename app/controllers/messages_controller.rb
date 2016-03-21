class MessagesController < ApplicationController
  before_filter :set_user
  def index
    @messages = Message.where("recipient LIKE '%?%'", @user.id)
  end

  def new
    @message = @user.messages.build
    @friends = @user.friends
  end

  def create
    @message = @user.messages.build(message_params)
    emailList = @message.recipient.split(',')
    recipientsList = User.where("email IN (?)", emailList).pluck(:id)*","
    @message.recipient = recipientsList
    if @message.save
      emailList.each do |e|
        ChatMailer.send_message_email(@message, User.find_by(email:e)).deliver_now
      end
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
    if (@user.id != @message.user_id)
      ChatMailer.read_message_email(@message, @user).deliver_now
    end
    if !@message.is_read && @message.user_id != @user.id

      if @message.update_attributes(is_read:true, read_at:DateTime.now)

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
