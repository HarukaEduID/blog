require 'test_helper'

class ManageArticleTest < Capybara::Rails::TestCase
  teardown do
    Rails.cache.clear
  end

  test 'show error messages when failed to create' do
    visit new_article_path
    click_button 'Save Article'
    assert page.must_have_content "Title can't be blank"
    assert page.must_have_content "Title is too short (minimum is 5 characters)"
  end

  test 'show error messages when failed to update' do
    visit edit_article_path(articles(:one))
    fill_in('Title', with: nil)
    click_button 'Save Article'
    assert page.must_have_content "Title can't be blank"
    assert page.must_have_content "Title is too short (minimum is 5 characters)"
  end
end
