class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.integer :external_id

      t.timestamps
    end
    add_index :articles, :external_id
  end
end
