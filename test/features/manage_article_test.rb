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
end
