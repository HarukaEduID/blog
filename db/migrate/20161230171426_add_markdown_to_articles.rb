class AddMarkdownToArticles < ActiveRecord::Migration[5.0]
  def self.up
    add_column :articles, :text_md, :text
  end

  def self.down
    remove_column :articles, :text_md
  end
end
