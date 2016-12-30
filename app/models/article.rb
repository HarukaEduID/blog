#:nodoc:
class Article < ApplicationRecord
  validates :title, presence: true,
                    length: { minimum: 5 }

  before_save :convert_markdown_to_html, if: :text_md?

  private

  def convert_markdown_to_html
    self.text = MarkdownWriter.new(self).run(markdown: text_md, column: :text)
  end
end
