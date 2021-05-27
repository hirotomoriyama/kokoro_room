class Public::SearchesController < Public::ApplicationController
  def search
    # 検索対象のモデルを格納
    @column = params['column']
    # 検索内容を格納
    @content = params['content']
    # 上記2つを用いて検索
    @datas = search_for(@column, @content)
  end

  private

  def search_for(column, content)
    if column == 'title'
      # 検索された悩み事のタイトルを取得
      Problem.where("title LIKE ?", "%#{content}%")
    elsif column == 'body'
      # 検索された悩み事の内容を取得
      Problem.where("body LIKE ?", "%#{content}%")
    end
  end
end
