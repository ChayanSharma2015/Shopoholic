class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.text :address
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
