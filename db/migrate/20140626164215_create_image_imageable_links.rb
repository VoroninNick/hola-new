class CreateImageImageableLinks < ActiveRecord::Migration
  def change
    create_table :image_imageable_links do |t|
      t.integer :image_id
      t.string :image_type
      t.integer :imageable_id
      t.string :imageable_type

      t.timestamps
    end
  end
end
