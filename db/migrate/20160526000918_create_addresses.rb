class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :kind, { null: false }
      t.string :street_address, { null: false }
      t.string :city, { null: false }
      t.string :state, { null: false }
      t.integer :zip, { null: false }
      t.integer :person_id, { null: false }

      t.timestamps null: false
    end
  end
end
