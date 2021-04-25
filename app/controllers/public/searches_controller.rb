class Public::SearchesController < Public::ApplicationController
  def search
    # 検索対象のモデルを格納
    @model = params['search']['model']
    # 検索内容を格納
    @content = params['search']['content']
    # 検索方法を格納
    @how = params['search']['how']
    # 上記3つを用いて検索
    @datas = search_for(@model, @content, @how)
  end

  private

  # 検索された悩み事のタイトルが完全一致するものを取得
  def match(model, content)
    Problem.where(title: content)
  end

  # 検索された悩み事のタイトルが部分一致するものを取得
  def partical(model, content)
    Problem.where('title LIKE ?', "%#{content}%")
  end

  def search_for(model, content, how)
    case how
    # 完全一致の場合の検索
    when 'match'
      match(model, content)
    # 部分一致の場合の検索
    when 'partical'
      partical(model, content)
    end
  end
end
