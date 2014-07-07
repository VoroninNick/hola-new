class CreateMetadata < ActiveRecord::Migration
  def up
    create_table :metadata do |t|
      t.belongs_to :page, index: true
      t.text :meta_description
      t.string :head_title

      t.timestamps
    end

    Metadata.create_translation_table!(head_title: :string , meta_description: :text)
  end

  def down
    drop_table :metadata

    Metadata.drop_translation_table!
  end
end
