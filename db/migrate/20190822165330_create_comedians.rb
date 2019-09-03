class CreateComedians < ActiveRecord::Migration[5.1]
  def change
    create_table :comedians do |t|
      t.string :name
      t.string :city
      t.integer :age

      t.timestamps
    end
  end
end
