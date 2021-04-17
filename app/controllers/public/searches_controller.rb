class Public::SearchesController < Public::ApplicationController

  def search
    @model = params['search']['model']
    @content = params['search']['content']
    @how = params['search']['how']
    @datas = search_for(@model, @content, @how)
  end

  private

  def match(model, content)
    Problem.where(title: content)
  end

  def partical(model, content)
    Problem.where('title LIKE ?', "%#{content}%")
  end

  def search_for(model, content, how)
    case how
    when 'match'
      match(model, content)
    when 'partical'
      partical(model, content)
    end
  end

end
