class CreateBlockings < ActiveRecord::Migration
  def change
    create_table :blockings do |t|
      t.integer :page_id
      t.integer :page_block_id
      t.timestamps
    end
  end
end
