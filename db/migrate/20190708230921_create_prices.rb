class CreatePrices < ActiveRecord::Migration[5.2]
  def change
    create_table :prices do |t|
      t.date :effective_from, null: false
      t.decimal :price, null: false
      t.references :product, null: false

      t.timestamps
    end

    add_index :prices, [:effective_from, :product_id], unique: true
    add_foreign_key :prices, :products, column: :product_id
  end
end
