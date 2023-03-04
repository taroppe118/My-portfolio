class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
    @places = Place.all
    @place = Place.new
  end

  def show
    @user = User.find(params[:id])
    @places = Place.all # =Place.user.allから変更した
    @place = Place.new
  end
  
  def create
    @user = User.create(user_params)
    if @user.save
      flash[:notice] = "User was successfully created." 
      redirect_to user_path(@user.id)
    else
      @users = User.all
      render :'users/index'
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render 'users/edit'
    else
      redirect_to user_path(current_user)
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "User was successfully updated." 
      redirect_to user_path(@user)
    else
      @users = User.all
      render :'users/edit'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
