class CreateAppartmentImages < ActiveRecord::Migration
  def up
    create_table :appartment_images do |t|
      t.string :image
      t.string :alt
      t.text :description
      t.string :title
      t.boolean :publish
      t.integer :appartment_id

      t.timestamps
    end

    AppartmentImage.create_translation_table!
  end

  def down
    drop_table :appartment_images

    AppartmentImage.drop_translation_table!
  end
end
