class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create, :show, :edit, :update]
  before_action :set_profile, only: [:show, :edit, :update]
  before_action :user_profile_check, only: [:edit, :update]

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

  def set_profile
    @profile = Profile.find(current_user.profile.id)
  end

  def user_profile_check
    if @profile.user != current_user
      redirect_to root_path
    end
  end
end
