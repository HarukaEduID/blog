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

  test 'save into text column when assign markdown text' do
    article = Article.new(title: 'Lorem title', text_md: '# H1 heading')

    article.save

    assert_equal true, article.text_md?

    # ensure that the callback fills the text column
    assert_equal true, article.text.present?
    # ensure that text is not equal to text_md
    refute article.text_md == article.text
  end
end
