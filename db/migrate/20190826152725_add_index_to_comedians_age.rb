class AddIndexToComediansAge < ActiveRecord::Migration[5.1]
  def change
    add_index :comedians, :age
  end
end
