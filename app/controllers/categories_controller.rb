class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :get_user, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @category = Category.includes(:profile)
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

  def show
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to profile_category_path(@user.profile.id, @category.id)
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to root_path
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

  def set_category    
    @category = Category.find(params[:id])
  end

end 
