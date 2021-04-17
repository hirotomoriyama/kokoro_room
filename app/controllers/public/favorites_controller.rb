class Public::FavoritesController < Public::ApplicationController

  def create
    advice = Advice.find(params[:advice_id])
    favorite = current_member.favorites.new(advice_id: advice.id)
    favorite.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    advice = Advice.find(params[:advice_id])
    favorite = current_member.favorites.find_by(advice_id: advice.id)
    favorite.destroy
    redirect_back(fallback_location: root_path)
  end

end
