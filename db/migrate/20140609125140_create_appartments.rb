class CreateAppartments < ActiveRecord::Migration
  def change
    create_table :appartments do |t|
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
