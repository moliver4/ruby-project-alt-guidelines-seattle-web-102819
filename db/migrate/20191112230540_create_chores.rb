class CreateChores < ActiveRecord::Migration[5.2]
  def change
    create_table :chores do |t|
      t.integer :kid_id
      t.integer :task_id
      t.boolean :completed

      t.timestamps
    end
  end
end
