class CreateRequestObjects < ActiveRecord::Migration
  def change
    create_table :request_objects do |t|
      t.integer :cycle, limit: 8
      t.string :class_name
      t.integer :instance_id ,limit: 8

      t.timestamps
    end
    add_index :request_objects, :cycle
  end
end
