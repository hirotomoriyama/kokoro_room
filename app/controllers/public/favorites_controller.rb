class Public::FavoritesController < Public::ApplicationController
  def create
    @problem = Problem.find(params[:problem_id])
    @advice = Advice.find(params[:advice_id])
    # いいねを付ける回答の指定
    favorite = current_member.favorites.new(advice_id: @advice.id)
    favorite.save
  end

  def destroy
    @problem = Problem.find(params[:problem_id])
    @advice = Advice.find(params[:advice_id])
    # いいねを外す回答の指定
    favorite = current_member.favorites.find_by(advice_id: @advice.id)
    favorite.destroy
  end
end
