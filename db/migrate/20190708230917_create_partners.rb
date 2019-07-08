class CreatePartners < ActiveRecord::Migration[5.2]
  def change
    create_table :partners do |t|
      t.string :name, null: false
      t.string :email
      t.string :phone
      t.string :contact
      t.string :shipping_courier
      t.string :shipping_account_number
      t.references :shipping_address, index: true
      t.references :shipping_address_chinese, index: true
      t.references :billing_address, index: true

      t.timestamps
    end

    add_foreign_key :partners, :addresses, column: :shipping_address_id
    add_foreign_key :partners, :addresses, column: :shipping_address_chinese_id
    add_foreign_key :partners, :addresses, column: :billing_address_id
  end
end
