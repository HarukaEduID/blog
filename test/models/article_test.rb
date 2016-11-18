require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test 'invalid without title' do
    article = Article.new
    refute article.valid?
    assert_not_nil article.errors[:title]
  end

  test 'invalid when title less that five characters' do
    article = Article.new(title: 'Foo')
    refute article.valid?
    assert_not_nil article.errors[:title]
  end
end
