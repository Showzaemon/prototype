class CreateFirms < ActiveRecord::Migration
  def change
    create_table :firms do |t|
      t.string :name
      t.integer :step , limit: 8
      t.integer :stock, limit: 8

      t.timestamps
    end
    add_index :firms, :name, unique: true
  end
end
