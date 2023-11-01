class CreatePageLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :page_links do |t|
      t.references :page, null: false, foreign_key: true
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
