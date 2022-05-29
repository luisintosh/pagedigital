class RemoveImageFieldsFromPageProfile < ActiveRecord::Migration[7.0]
  def change
    remove_column :page_profiles, :profile_image, :string
    remove_column :page_profiles, :header_image, :string
  end
end
