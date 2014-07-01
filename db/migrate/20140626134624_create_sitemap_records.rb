class CreateSitemapRecords < ActiveRecord::Migration
  def change
    create_table :sitemap_records do |t|
      t.belongs_to :page, index: true
      t.boolean :displayed_on_sitemap
      t.string :location
      t.string :path
      t.datetime :last_modified
      t.string :change_frequency
      t.float :priority

      t.timestamps
    end
  end
end
