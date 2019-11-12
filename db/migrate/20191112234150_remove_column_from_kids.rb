class RemoveColumnFromKids < ActiveRecord::Migration[5.2]
  def change
    remove_column :kids, :birthday
  end
end
