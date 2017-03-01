class FixImageToProduct < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :photo, :image
  end
end
