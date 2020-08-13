class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.integer :price, null: false
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
    add_index :books, [:author_id, :title], unique: true
  end
end
