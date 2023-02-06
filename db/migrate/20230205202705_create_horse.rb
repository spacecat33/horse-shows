class CreateHorse < ActiveRecord::Migration[6.1]
  def change
    create_table :horses do |t|
      t.string :name
      t.integer :level
      t.string :breed
      t.integer :height
      t.string :colour
      t.integer :age

      t.timestamps
    end
  end
end
