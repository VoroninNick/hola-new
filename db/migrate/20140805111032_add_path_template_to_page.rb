class AddPathTemplateToPage < ActiveRecord::Migration
  def change
    change_table :pages do |t|
      t.belongs_to :path_template
    end
  end
end
