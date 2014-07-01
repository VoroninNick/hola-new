class CreateAppartments < ActiveRecord::Migration
  def change
    create_table :appartments do |t|
      t.belongs_to :region, index: true
      t.float :lat
      t.float :lng
      t.float :price
      t.string :name
      t.string :address
      t.string :main_image
    end
  end
end
