class AddTitleToAdvice < ActiveRecord::Migration[5.0]
  def change
    add_column :advices, :title, :string
  end
end
