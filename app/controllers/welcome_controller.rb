class WelcomeController < ApplicationController
  before_filter :require_login
  def index
  end

  private
  def require_login
    if authorize_user?
      redirect_to messages_path
    end
  end
end
