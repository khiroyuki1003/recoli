class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :get_user, only: [:index, :new, :create]

  def index
    @category = Category.includes(:profile).order("created_at DESC")
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to root_path
    else
      render :new
    end
  end

  private 
  def get_user
    if user_signed_in?
      @user = User.find(current_user.id)
    end
  end

  def category_params
    params.require(:category).permit(:category_name).merge(profile: @user.profile)
  end
end 
