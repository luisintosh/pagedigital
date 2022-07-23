class UpdatePageAppearancePrimaryColor < ActiveRecord::Migration[7.0]
  def change
    change_column :page_appearances, :primary_color, :integer, using: 'primary_color::integer', default: 0
  end
end
