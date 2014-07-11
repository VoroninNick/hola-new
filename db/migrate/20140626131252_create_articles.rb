class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.boolean :publish
      t.string :title
      t.string :avatar
      t.text :short_description
      t.datetime :release_date
      t.text :content
      t.string :article_type


      t.timestamps
    end

    Article.create_translation_table!
  end

  def down
    drop_table :articles

    Article.drop_translation_table!
  end
end
