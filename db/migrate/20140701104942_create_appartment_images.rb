class CreateAppartmentImages < ActiveRecord::Migration
  def change
    create_table :appartment_images do |t|
      t.string :image
      t.string :alt
      t.text :description
      t.string :title
      t.boolean :publish
      t.integer :appartment_id

      t.timestamps
    end
  end
end
