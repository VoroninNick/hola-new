class CreateDictionaries < ActiveRecord::Migration
  def up
    create_table :dictionaries do |t|
      t.string :name
      t.text :content

      t.timestamps
    end

    Dictionary.create_translation_table!
  end

  def down
    drop_table :dictionaries

    Dictionary.drop_translation_table!
  end
end
