class ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_user
  before_action :set_category, only: [:new, :create, :show]
  before_action :category_access_check, only: [:new, :create, :show]
  before_action :set_list, only: [:show]

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to  profile_category_path(@user.profile.id, @category.id)
    else
      render :new
    end
  end

  def show
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

  def category_access_check
    if @category.profile_id != @user.profile.id
      redirect_to root_path
    end
  end

  def list_params
    category = Category.find(params[:list][:category_id].to_i)
    params.require(:list).permit(:list_title, :list_detail, :priority_id).merge(category: category)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
 