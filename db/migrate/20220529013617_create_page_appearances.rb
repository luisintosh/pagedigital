class CreatePageAppearances < ActiveRecord::Migration[7.0]
  def change
    create_table :page_appearances do |t|
      t.integer :theme, default: 0
      t.integer :font, default: 0
      t.string :primary_color
      t.references :page, foreign_key: true

      t.timestamps
    end
  end
end
