class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
<<<<<<< HEAD
  skip_before_action :authenticate_user!, only: [:index]
  def home
  end

  def index
  end

  def show
    @item = Item.find(params[:id])
=======
  skip_before_action :authenticate_user!, only: [:home, :index, :show]

  def home
    @items = Item.all
  end

  def index
    @items = Item.all
  end

  def show
>>>>>>> 14cf32132eafcc114adcace82672c89ac1b5dc33
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
<<<<<<< HEAD

=======
      flash[:notice] = "Added a new item!"
      redirect_to @item
    else
      render :new
    end
>>>>>>> 14cf32132eafcc114adcace82672c89ac1b5dc33
  end

  def edit
  end

  def update
<<<<<<< HEAD
  end

  def destroy
=======
    if @item.update(item_params)
      flash[:notice] = "You've updated your item! "
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  def destroy
    redirect_to home_path
>>>>>>> 14cf32132eafcc114adcace82672c89ac1b5dc33
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :state, :description, :category, :address, :reward, :photo)
  end
end
