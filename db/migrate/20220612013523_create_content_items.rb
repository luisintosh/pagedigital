class CreateContentItems < ActiveRecord::Migration[7.0]
  def change
    create_table :content_items do |t|
      t.string :url
      t.string :title
      t.string :subtitle
      t.boolean :embedded
      t.boolean :highlight
      t.boolean :custom_thumbnail
      t.boolean :schedule
      t.datetime :schedule_date
      t.integer :position
      t.references :page, null: false, foreign_key: true

      t.timestamps
    end
  end
end
