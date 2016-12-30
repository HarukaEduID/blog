require 'test_helper'

class MarkdownWriterTest < ActiveSupport::TestCase
  setup do
    @object = articles(:one)
  end

  test "confirm that it transforms markdown text to html text" do
    markdown = '# H1 heading'

    MarkdownWriter.new(@object).run(markdown: markdown, column: :text)

    assert_match '<h1>H1 heading</h1>', @object.text
  end
end
