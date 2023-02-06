class CreateShow < ActiveRecord::Migration[6.1]
  def change
    create_table :shows do |t|
      t.string :title
      t.string :location
      t.string :discipline
      t.integer :level
      t.integer :entry_fee
      t.belongs_to :user, foreign_key: true
      t.belongs_to :horse, foreign_key: true

      t.timestamps
    end
  end
end
