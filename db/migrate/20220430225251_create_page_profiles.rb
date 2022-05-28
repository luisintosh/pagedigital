class CreatePageProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :page_profiles do |t|
      t.string :display_name
      t.string :location
      t.text :description
      t.string :profile_image
      t.string :header_image
      t.references :page, foreign_key: true

      t.timestamps
    end
  end
end
