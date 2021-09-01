class ListDeadlinesController < ApplicationController
  before_action :get_user

  def index
  end

  def edit
  end

  def update
  end

  private
  def get_user
    if user_signed_in?
      @user = User.find(current_user.id)
    end
  end
end
  