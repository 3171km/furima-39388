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
      @item = Item.find(params[:id])
    end
  
    def edit
      if user_signed_in?
        @item = Item.find(params[:id])
        redirect_to root_path unless current_user.id == @item.user_id
      else
        redirect_to  root_path 
      end
    end
  
    def update
      @item = Item.find(params[:id])
      if @item.update(item_params)
        redirect_to item_path(@item.id)
      else
        render :edit
      end
    end
  
    def destroy
    end
  
  
  private
  
    def item_params
    params.require(:item).permit(:image, :title, :overview, :category_id, :status_id, :burden_id, :region_id, :shipment_id,:price).merge(user_id: current_user.id)
    end
    end