class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  # before_action :move_to_index, only: [:edit, :update]

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
      render action: :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    redirect_to root_path unless @item.user == current_user
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      render action: :show
    else
      render action: :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :shipping_cost_id, :prefecture_id,
                                 :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  # def move_to_index
  #   unless user_signed_in? == current_user.
  #     redirect_to root_path
  #   end
  # end
end
