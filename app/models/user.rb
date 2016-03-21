class User < ActiveRecord::Base
  has_secure_password
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :messages
  mount_uploader :avatar, AvatarUploader

  def status
    self.friendships.find_by_friend_id(self.id).status
  end
end
