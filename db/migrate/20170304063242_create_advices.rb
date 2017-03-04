class CreateAdvices < ActiveRecord::Migration[5.0]
  def change
    create_table :advices do |t|
      t.string :name
      t.text :description
      t.string :phone

      t.timestamps
    end
  end
end
