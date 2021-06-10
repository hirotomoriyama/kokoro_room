class Public::HomesController < Public::ApplicationController
  def top
    if member_signed_in?
      @member = current_member
      option = params['option']
      @problems = search_for(option)
    end
  end

  def about
  end

  def map
  end

  private

  # 悩み事の絞り込み検索時の選択肢
  def search_for(option)
    # 全て表示の場合
    if option == "all"
      @member.problems.page(params[:page])
    # 回答受付中の場合
    elsif option == "unsolved"
      @member.problems.where(best_answer_id: nil).page(params[:page])
    # 解決済みの場合
    elsif option == "solved"
      @member.problems.where.not(best_answer_id: nil).page(params[:page])
    # 未選択の場合
    else
      @member.problems.page(params[:page])
    end
  end
end
