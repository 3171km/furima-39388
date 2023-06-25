class ItemsController < ApplicationController

before_action :authenticate_user!, only: [:new]

  def index 
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end
  end

  def edit
  end

  def update
  end

  def destroy
  end

private

def item_params
  params.require(:item).permit(:image, :title, :overview, :category_id, :status_id, :burden_id, :region_id, :shipment_id,:price).merge(user_id: current_user.id)
  end