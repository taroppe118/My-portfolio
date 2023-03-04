class PlacesController < ApplicationController
  def index
    @places = Place.all
    @place = Place.new
    @user = current_user
  end
  
  def show
    @place = Place.find(params[:id])
    @place_new = Place.new
    @user = @place.user
  end
  
  def create
    @place = Place.new(place_params)  # フォームから送られてきたデータ(body)をストロングパラメータを経由して@placeに代入
    @place.user_id = current_user.id # user_idの情報はフォームからはきていないので、deviseのメソッドを使って「ログインしている自分のid」を代入
    if @place.save
      flash[:notice] = "place was successfully created."
      redirect_to place_path(@place)
    else
      @places = Place.all
      render :"places/index"
    end
  end

  def edit
    @place = Place.find(params[:id])
    if @place.user == current_user
      render :"edit"
    else
      redirect_to places_path
    end
  end

  def update
    @place = Place.find(params[:id])
    if @place.update(place_params)
      flash[:notice] = "place was successfully updated." 
      redirect_to place_path(@place)
    else
      @places = Place.all
      render :'places/edit'
    end
  end 
    
  def destroy
    place = Place.find(params[:id])
    place.delete
    redirect_to places_path
  end
    
private
  
  def place_params
    params.require(:place).permit(:title, :body)
  end
    
end