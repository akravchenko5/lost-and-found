class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:home, :index, :show, :map, :lost, :found]

  def map
    items = Item.where('address ILIKE?', "%oslo%")
    set_map(items);
  end

  def search
  end

  def home
    @items = Item.all
  end

  def index
    if search_terms
      # json_hits = Item.search.raw_answer.with_indifferent_access[:hits]
      @items = Item.search(search_terms)
      ip = Ip::Lookup.server_whatismyipaddress
      @location = Geocoder.search(ip).first.coordinates
    else
      @items = Item.all
    end
  end

  def lost
    @items = Item.lost
  end

  def found
    @items = Item.found
  end

  def new_found
    @item = Item.new
  end

  def new_lost
    @item = Item.new
  end

  def show
    @item = Item.where(id: params[:id])
    set_map(@item);
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    @item.user = current_user
    if @item.save
      flash[:notice] = "Added a new item!"
      redirect_to @item
    else
      if @item.found?
        render :new_found
      end
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      flash[:notice] = "You've updated your item! "
      redirect_to @item
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def search_terms
    search_item = params[:query]
    [
      search_item[:title],
      search_item[:address],
      search_item[:category],
      search_item[:state]
    ].compact
  end

  def set_item
    @item = Item.find(params[:id])
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

      {
        lat: item.latitude,
        lng: item.longitude,
        infoWindow: render_to_string(partial: "map_info_window", locals: { item: item }),
        image_url: helpers.asset_url(pointer)
      }
    end
  end
end
