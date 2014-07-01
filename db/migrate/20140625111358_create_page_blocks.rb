class CreatePageBlocks < ActiveRecord::Migration
  def change
    create_table :page_blocks do |t|

      t.timestamps
    end
  end
end
