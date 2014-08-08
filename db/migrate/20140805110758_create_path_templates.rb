class CreatePathTemplates < ActiveRecord::Migration
  def change
    create_table :path_templates do |t|
      t.string :name
      t.string :template

      t.timestamps
    end
  end
end
