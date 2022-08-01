class UpdatePublishedTrueToPages < ActiveRecord::Migration[7.0]
  def change
    change_column :pages, :published, :boolean, default: true
  end
end
