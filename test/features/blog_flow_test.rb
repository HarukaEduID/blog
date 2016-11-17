require 'test_helper'

class BlogFlowTest < Capybara::Rails::TestCase
  setup do
    @article = articles(:one)
  end

  test 'can access all articles list' do
    visit root_path
    click_link 'My Blog'
    assert page.has_current_path? articles_path
  end

  test 'can access new article form' do
    visit articles_path
    click_link 'New article'
    assert page.has_current_path? new_article_path
  end

  test 'can access articles list from new article form' do
    visit new_article_path
    click_link 'Back'
    assert page.has_current_path? articles_path
  end

  test 'can access articles list from show article' do
    visit article_path(@article)
    click_link 'Back'
    assert page.has_current_path? articles_path
  end
end
