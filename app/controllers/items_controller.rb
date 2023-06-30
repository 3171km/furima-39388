class ItemsController < ApplicationController
  
before_action :authenticate_user!, only: [:new, :edit, :destroy]
before_action :find_item, only: [:show, :edit, :update, :destroy]
before_action :check_user, only: [:edit, :destroy]

def index 
  @items = Item.all.order(created_at: :desc)
  @burden = Burden.all
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

def edit
  if @item..status == 'sold'
    redirect_to root_path
end
end


def update
  if @item.update(item_params)
    redirect_to item_path(@item.id)
  else
    render :edit
  end
end

def destroy
  redirect_to root_path if @item.destroy
end

private

def item_params
  params.require(:item).permit(:image, :title, :overview, :category_id, :status_id, :burden_id, :region_id, :shipment_id,:price).merge(user_id: current_user.id)
end

def find_item
  @item = Item.find(params[:id])
end

def check_user
  redirect_to root_path unless current_user.id == @item.user.id
end
end