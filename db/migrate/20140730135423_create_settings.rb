class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :name
      t.string :value

      t.belongs_to :configuration

      t.timestamps
    end
  end
end
