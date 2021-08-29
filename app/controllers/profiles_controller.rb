class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create, :show, :edit, :update]
  before_action :set_user, only: [:new, :show, :edit, :update]
  before_action :set_profile, only: [:show, :edit, :update]
  before_action :user_profile_check, only: [:new, :edit, :update]

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
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
    if @profile.update(profile_params)
      redirect_to profile_path(@profile.id)
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:nickname, :precious_word, :birth_date).merge(user: current_user)
  end

  def set_user
    @user = User.find(current_user.id)
  end

  def set_profile
    @profile = Profile.find(@user.profile.id)
  end

  def user_profile_check
    if @user.profile.present?
      redirect_to root_path
    end
  end
end
 