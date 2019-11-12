class CreateKids < ActiveRecord::Migration[5.2]
  def change
    create_table :kids do |t|
      t.string :name
      t.integer :age
      t.integer :skill_level
      t.datetime :birthday
    end
  end
end
