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
    if Friendship.where("user_id = ? AND friend_id = ?", session[:user_id], params[:id]) == []

      @friendship = Friendship.new(user_id: @user.id, friend_id: params[:id])
    end

    if Friendship.where("user_id = ? AND friend_id = ?", params[:id], session[:user_id]) == []

      second_friendship = Friendship.new(user_id: params[:id], friend_id: @user.id )
    end

    if @friendship
      if @friendship.save
        if second_friendship

          if second_friendship.save
            flash[:success] = 'You have added new friend to your list.'
            redirect_to friendships_path
          end


        end
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

  def remove_friend
    friend1 = Friendship.where("user_id = ? AND friend_id = ?", session[:user_id], params[:id]).pluck(:id)
    friend2 = Friendship.where("user_id = ? AND friend_id = ?", params[:id], session[:user_id]).pluck(:id)

    Friendship.destroy(friend1)
    Friendship.destroy(friend2)
    flash[:success] = 'You have removed new friend to your list.'
    redirect_to friendships_path

  end

  def block_friend
    friendship = Friendship.where("user_id = ? AND friend_id = ?", session[:user_id], params[:id]).pluck(:id)
    if friendship
      @relationship = Friendship.find(friendship).first
      @relationship.update_attributes(status:'block')
      redirect_to friendships_path
    else
      newFriendBlock = Friendship.new(user_id: @user.id, friend_id: params[:id], status:'block')
      if newFriendBlock.save
        redirect_to friendships_path
      end
    end
  end

  private
  def check_friendship_status(user, friend)
    friendship = Friendship.find_by_user_id_and_friend_id(user, friend)
    byebug
    if friendship.status == 'block'
      'block'
    end
  end
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
    params.require(:friendship).permit(:user_id, :friend_id, :status)
  end
end
