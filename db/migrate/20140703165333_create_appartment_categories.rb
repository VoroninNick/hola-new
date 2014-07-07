class CreateAppartmentCategories < ActiveRecord::Migration
  def up
    create_table :appartment_categories do |t|
      t.string :name
      t.string :description

      t.timestamps
    end

    AppartmentCategory.create_translation_table!
  end

  def down
    drop_table :appartment_categories

    AppartmentCategory.drop_translation_table!
  end
end
