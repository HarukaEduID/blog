require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:one)
  end

  teardown do
    Rails.cache.clear
  end

  test 'should get new' do
    get new_article_url
    assert_response :success
  end

  test 'should create article' do
    assert_difference('Article.count') do
      post articles_url, params: { article: { text: @article.text, title: @article.title } }
    end

    assert_redirected_to article_path(Article.last)
  end

  test 'should show back the form' do
    post articles_url, params: { article: { text: @article.text } }

    assert_template 'articles/new'
  end

  test 'should show article' do
    get article_url(@article)
    assert_response :success
  end

  test 'should get index' do
    get articles_url
    assert_response :success
  end
end
