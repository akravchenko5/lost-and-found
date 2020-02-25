class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:home, :index, :show, :map]

  def map
    @items = Item.where('address ILIKE?', "%oslo%")
    set_map(@items);
     #returns flats with coordinates

  end

  def home
    @items = Item.all
  end

  def index
    @items = Item.all
  end

  def lost
    @items = Item.lost
  end

  def found
    @items = Item.found
  end

  def show
    @item = Item.find(params[:id])
  end

  def home
    @items = Item.all
  end

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      flash[:notice] = "Added a new item!"
      redirect_to @item
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    if @item.update(item_params)
      flash[:notice] = "You've updated your item! "
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  def destroy
    redirect_to home_path
  end

  private

  def set_item
    # @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :state, :description, :category, :address, :reward, :photo)
  end

  def set_map(items)
    @map_items = items.geocoded #returns flats with coordinates

    @markers = @map_items.map do |item|
      if item.state == 'lost'
        pointer = 'pointer_black.svg'
      else
        pointer = 'pointer_white.svg'
      end

      puts ">>>> #{helpers.asset_url(pointer)}"

      {
        lat: item.latitude,
        lng: item.longitude,
        infoWindow: render_to_string(partial: "map_info_window", locals: { item: item }),
        image_url: helpers.asset_url(pointer)
      }
    end
  end
end
