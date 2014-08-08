class ArticlesController < ApplicationController
  def articles_list
    @items = Article.where(publish: 't', article_type: 'article').order('updated_at desc')

    render template: 'articles/list'
  end

  def article_item
    @item = Article.where(publish: 't', article_type: 'article').last

    render template: 'articles/item'
  end

  def news_list
    render template: 'articles/list'
  end

  def news_item
    @item = Article.where(publish: 't', article_type: 'news').last

    render template: 'articles/item'
  end
end
