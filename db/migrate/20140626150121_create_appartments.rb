class CreateAppartments < ActiveRecord::Migration
  def up
    create_table :appartments do |t|
      t.belongs_to :region, index: true
      t.belongs_to :appartment_category, index: true
      t.boolean :publish
      t.boolean :available
      t.boolean :recommended
      t.float :lat
      t.float :lng
      t.float :price
      t.string :name
      t.string :address
      t.text :intro_text
      t.text :description
      t.string :main_image


    end

    Appartment.create_translation_table!
  end

  def down
    drop_table :appartments

    Appartment.drop_translation_table!
  end
end
