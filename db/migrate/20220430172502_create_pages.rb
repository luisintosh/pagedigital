class CreatePages < ActiveRecord::Migration[7.0]
  def change
    create_table :pages do |t|
      t.string :slug, limit: 24
      t.boolean :published, default: false
      t.string :lock_code

      t.timestamps
    end
    add_index :pages, :slug, unique: true
  end
end
