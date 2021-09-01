class ListDeadlinesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_user
  before_action :set_category, only: [:edit, :update]
  before_action :set_list
  before_action :set_list_deadline, only: [:edit, :update]

  def index
  end

  def edit
  end

  def update
    if @list_deadline.update(list_deadline_params)
      redirect_to profile_category_list_path(@user.profile.id, @category.id, @list.id)
    else
      render :edit
    end 
  end

  private
  def get_user
    if user_signed_in?
      @user = User.find(current_user.id)
    end
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_list
    @list = List.find(params[:list_id]) 
  end

  def set_list_deadline
    @list_deadline = ListDeadline.find(params[:id])
  end

  def list_deadline_params
    params.require(:list_deadline).permit(:list_deadline_date, :list_deadline_time).merge(list: @list )
  end
end
  