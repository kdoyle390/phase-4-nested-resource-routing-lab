class ItemsController < ApplicationController

  def index
    items = Item.all
    render json: items, include: :user
  end

  def show
    if params[:user_id]
      user = User.find(params[:user_id])
      items = user.items.find(params[:id])
    else
      items = Item.all
    end
      render json: items, include: :user
  end


end
