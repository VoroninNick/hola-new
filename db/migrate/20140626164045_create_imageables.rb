class CreateImageables < ActiveRecord::Migration
  def change
    create_table :imageables do |t|

      t.timestamps
    end
  end
end
