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
      post articles_url,
           params: { article: { text: @article.text, title: @article.title } }
    end

    assert_redirected_to article_path(Article.last)
  end

  test 'should show the new article form' do
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

  test 'should get edit' do
    get edit_article_url(@article)
    assert_equal @article, assigns(:article)
  end

  test 'should update article' do
    patch article_url(@article), params: { article: { title: 'updated' } }
    assert_redirected_to article_path(@article)
    @article.reload
    assert_equal 'updated', @article.title
  end

  test 'should show the edit article form' do
    patch article_url(@article),
          params: { article: { text: @article.text, title: nil } }
    assert_template 'articles/edit'
  end
end
