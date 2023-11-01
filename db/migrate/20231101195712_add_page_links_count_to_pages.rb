class AddPageLinksCountToPages < ActiveRecord::Migration[7.1]
  def change
    add_column :pages, :page_links_count, :integer
  end
end
