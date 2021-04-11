class Admin::CategoriesController < Admin::ApplicationController

  def index
    @category = Category.new
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    @category.save
    # 投稿後、同じページに遷移
    redirect_back(fallback_location: root_path)
  end

  def edit
  end

  def update
  end

  private

  # カテゴリー投稿、編集時、カテゴリー名を入力するための設定
  def category_params
    params.require(:category).permit(:name)
  end

end
