class Public::SearchesController < Public::ApplicationController
  def search
    # 検索対象のモデルを格納
    @column = params['column']
    # 検索内容を格納
    @content = params['content']
    # 悩み事ステータスを格納
    @option = params['option']
    # 上記3つを用いて検索
    @datas = search_for(@column, @content, @option)
  end

  private

  def search_for(column, content, option)
    # 検索された悩み事のタイトルを取得
    if column == 'title'
      # 全て表示の場合
      if option == "all"
        Problem.where("title LIKE ?", "%#{content}%").page(params[:page])
      # 回答受付中の場合
      elsif option == "unsolved"
        @members = Member.where(is_deleted: false)
        Problem.where("title LIKE ?", "%#{content}%").where(best_answer_id: nil, member_id: @members.ids).page(params[:page])
      # 解決済みの場合
      elsif option == "solved"
        @members = Member.all
        Problem.where("title LIKE ?", "%#{content}%").where.not(best_answer_id: nil).where(member_id: @members.ids).page(params[:page])
      # 回答受付終了の場合
      elsif option == "finished"
        @members = Member.where(is_deleted: true)
        Problem.where("title LIKE ?", "%#{content}%").where(best_answer_id: nil, member_id: @members.ids).page(params[:page])
      end
    # 検索された悩み事の内容を取得
    elsif column == 'body'
      # 全て表示の場合
      if option == "all"
        Problem.where("body LIKE ?", "%#{content}%").page(params[:page])
      # 回答受付中の場合
      elsif option == "unsolved"
        @members = Member.where(is_deleted: false)
        Problem.where("body LIKE ?", "%#{content}%").where(best_answer_id: nil, member_id: @members.ids).page(params[:page])
      # 解決済みの場合
      elsif option == "solved"
        @members = Member.all
        Problem.where("body LIKE ?", "%#{content}%").where.not(best_answer_id: nil).where(member_id: @members.ids).page(params[:page])
      # 回答受付終了の場合
      elsif option == "finished"
        @members = Member.where(is_deleted: true)
        Problem.where("body LIKE ?", "%#{content}%").where(best_answer_id: nil, member_id: @members.ids).page(params[:page])
      end
    end
  end
end
