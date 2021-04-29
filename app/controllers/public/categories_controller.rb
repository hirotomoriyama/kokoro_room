class Public::CategoriesController < Public::ApplicationController
  def index
    @categories = Category.all
  end

  def show
  end
end
