class CreateAppartments < ActiveRecord::Migration
  def change
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
      t.string :main_image
    end
  end
end
