class Admin::CategoriesController < Admin::ApplicationController

  def index
    @category = Category.new
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    @category.save
    # カテゴリー作成後、同じページに遷移
    redirect_back(fallback_location: root_path)
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    # カテゴリー編集後、カテゴリー一覧画面に遷移
    redirect_to admin_categories_path
  end

  private

  # カテゴリー作成、編集時、カテゴリー名を入力するための設定
  def category_params
    params.require(:category).permit(:name)
  end

end
