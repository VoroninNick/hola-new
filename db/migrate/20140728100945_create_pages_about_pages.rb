class CreatePagesAboutPages < ActiveRecord::Migration
  def change
    create_table :pages_about_pages do |t|

      t.timestamps
    end
  end
end
