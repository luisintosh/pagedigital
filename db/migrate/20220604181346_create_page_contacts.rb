class CreatePageContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :page_contacts do |t|
      t.boolean :display_public_email, default: false
      t.string :public_email
      t.boolean :display_public_phone, default: false
      t.string :public_phone
      t.integer :public_phone_type
      t.string :main_contact_links
      t.references :page, foreign_key: true

      t.timestamps
    end
  end
end
