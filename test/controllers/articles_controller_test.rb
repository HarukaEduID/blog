require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get new_article_url
    assert_response :success
  end

  test 'should create article' do
    assert_difference('Article.count') do
      post articles_url, params: { article: { body: 'Rails is awesome!', title: 'Hello Rails' } }
    end

    assert_redirected_to article_path(Article.last)
  end

  test 'should show article' do
    article = articles(:one)
    get article_url(article)
    assert_response :success
  end
end
