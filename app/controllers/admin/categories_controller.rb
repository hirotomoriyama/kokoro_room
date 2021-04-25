class Admin::CategoriesController < Admin::ApplicationController
  def index
    @category = Category.new
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "カテゴリーを作成しました"
      # カテゴリー作成後、同じページに遷移
      redirect_back(fallback_location: root_path)
    else
      @categories = Category.all
      flash.now[:alert] = "カテゴリーを入力してください"
      # カテゴリー作成失敗後、同じページに遷移
      render :index
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = "カテゴリーを編集しました"
      # カテゴリー編集後、カテゴリー一覧画面に遷移
      redirect_to admin_categories_path
    else
      flash.now[:alert] = "カテゴリーを入力してください"
      render :edit
    end
  end

  private

  # カテゴリー作成、編集時、カテゴリー名を入力するための設定
  def category_params
    params.require(:category).permit(:name)
  end
end
