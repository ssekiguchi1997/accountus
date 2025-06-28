class Public::FavoritesController < ApplicationController

  def create
    tip = Tip.find(params[:tip_id])
    favorite = current_user.favorites.new(tip_id: tip.id)
    favorite.save
    redirect_to tip_path(tip)
  end

  def destroy
    tip = Tip.find(params[:tip_id])
    favorite = current_user.favorites.find_by(tip_id: tip.id)
    favorite.destroy
    redirect_to tip_path(tip)
  end

end
