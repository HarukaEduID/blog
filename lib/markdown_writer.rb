# Documentation for RedCarpet: https://github.com/vmg/redcarpet
class MarkdownWriter
  def initialize(object)
    @object = object
  end

  def run(markdown:, column:)
    output = converted_markdown(markdown)

    @object.write_attribute(column, output)
    # This is equivalent to:
    # self[:column] = converted_markdown
  end

  private

  def converted_markdown(markdown)
    renderer = Redcarpet::Render::HTML.new(
      filter_html: false,
      no_styles: true,
      no_images: false,
      with_toc_data: false,
      link_attributes: {:target => "_blank"}
    )
    converter = Redcarpet::Markdown.new(renderer)
    converter.render(markdown)
  end
end
