class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.string :path
      t.string :data
      t.string :controller
      t.string :action
      t.string :layout

      t.integer :custom_page_id
      t.string :custom_page_type

      t.timestamps
    end
  end
end
