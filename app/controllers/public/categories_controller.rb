class Public::CategoriesController < Public::ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    option = params['option']
    @problems = search_for(option)
  end

  private

  def search_for(option)
    # 全て表示の場合
    if option == "all"
      @category.problems
    # 回答受付中の場合
    elsif option == "unsolved"
      @members = Member.where(is_deleted: false)
      Problem.where(best_answer_id: nil, member_id: @members.ids, category_id: @category)
    # 解決済みの場合
    elsif option == "solved"
      @members = Member.all
      Problem.where.not(best_answer_id: nil).where(member_id: @members.ids, category_id: @category)
    # 回答受付終了の場合
    elsif option == "finished"
      @members = Member.where(is_deleted: true)
      Problem.where(best_answer_id: nil, member_id: @members.ids, category_id: @category)
    # 未選択の場合
    else
      @category.problems
    end
  end
end
