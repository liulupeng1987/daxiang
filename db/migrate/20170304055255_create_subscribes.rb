class CreateSubscribes < ActiveRecord::Migration[5.0]
  def change
    create_table :subscribes do |t|
      t.string :booktitle
      t.string :bookauthor
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
