class CreateRequestObjects < ActiveRecord::Migration
  def change
    create_table :request_objects do |t|
      t.integer :clock
      t.string :class_name
      t.integer :instance_id

      t.timestamps
    end
    add_index :request_objects, :clock
  end
end
