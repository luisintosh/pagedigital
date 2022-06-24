class UpdatePositionValueFromContentItem < ActiveRecord::Migration[7.0]
  def change
    change_column :content_items, :position, :integer, default: 0
  end
end
