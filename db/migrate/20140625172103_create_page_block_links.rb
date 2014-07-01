class CreatePageBlockLinks < ActiveRecord::Migration
  def change
    create_table :page_block_links do |t|
      t.integer :page_block_id
      t.string :page_block_type
      t.integer :page_id
      t.string :page_type
      t.timestamps
    end
  end
end
