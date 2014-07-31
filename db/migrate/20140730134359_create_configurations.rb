class CreateConfigurations < ActiveRecord::Migration
  def change
    create_table :configurations do |t|
      t.string :name
      t.boolean :current
      t.boolean :set_as_default

      t.timestamps
    end
  end
end
