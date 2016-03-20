class FriendshipsController < ApplicationController
  before_filter :set_user
  def index
    @friends = @user.friends

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end

  def create
    @friendship = Friendship.new(user_id: @user.id, friend_id: params[:id])
    second_friendship = Friendship.new(user_id: params[:id], friend_id: @user.id )

    if @friendship.save
      if second_friendship.save

        redirect_to friendships_path
      end
    else
      flash[:error] = 'Invalid email or password'
      render :new
    end
  end

  def new
    @friendship = FriendList.new
  end

  def show
    @friends = User.where("id != (?)", @user.id)
  end

  private
  def set_user
    #@user ||= User.find(params[:user_id])

    @user ||= User.find(session[:user_id]) if session[:user_id]
    if @user == nil
      redirect_to '/'
    end
  end

  def get_list_friends(friendships)
    friends = []
    friendships.each do |f|
      friends << User.find(f.friend_id)
    end
    friends
  end

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id)
  end
end
