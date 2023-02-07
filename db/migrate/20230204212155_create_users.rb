class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :provider
      t.string :uid
      t.string :image_url
      t.string :password_digest
      t.string :country
      t.string :level

      t.timestamps
    end
  end
end
