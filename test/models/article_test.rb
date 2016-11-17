require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test 'invalid without title' do
    article = Article.new
    refute article.valid?
    assert_not_nil article.errors[:title]
  end
end
