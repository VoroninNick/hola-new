class CreateSlider < ActiveRecord::Migration
  def change
    create_table :sliders do |t|
      t.string :name

      t.integer :sliderable_id
      t.string :sliderable_type

      t.timestamps
    end

    create_table :slides do |t|
      t.string :title
      t.string :description
      t.string :image
      t.belongs_to :slider

      t.timestamps
    end



  end
end
