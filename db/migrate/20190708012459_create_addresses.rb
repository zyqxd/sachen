class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :line_one, null: false
      t.string :line_two
      t.string :postal_code
      t.string :city, null: false
      t.string :subdivision, null: false
      t.string :country, null: false

      t.timestamps
    end
  end
end
