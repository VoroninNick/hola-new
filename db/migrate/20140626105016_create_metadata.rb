class CreateMetadata < ActiveRecord::Migration
  def change
    create_table :metadata do |t|
      t.belongs_to :page, index: true
      t.text :meta_description
      t.string :head_title

      t.timestamps
    end
  end
end
