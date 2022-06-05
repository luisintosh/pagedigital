class CreatePageIntegrations < ActiveRecord::Migration[7.0]
  def change
    create_table :page_integrations do |t|
      t.string :facebook_pixel
      t.string :google_analytics
      t.boolean :email_capture
      t.references :page, null: false, foreign_key: true

      t.timestamps
    end
  end
end
