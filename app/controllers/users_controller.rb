class UsersController < ApplicationController

  def show
    user = User.find_by(id: params[:id])
    render json: user, include: :items
  end

  def index
    users = User.all
    render json: users
  end

  def create
    item = Item.create!(item_params)
    if item.valid?
      render json: item, status: :accepted
    else 
      render json: item.errors.full_messages
    end
  end
end
