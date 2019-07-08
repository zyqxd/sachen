# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string(:category, null: false)
      t.string(:code, null: false)
      t.string(:description)
      t.string(:name, null: false)
      t.string(:pr_customer_field)
      t.integer(:reorder_threshold, null: false, default: 0)
      t.decimal(:tax_percent)
      t.boolean(:taxable, default: false)
      t.boolean(:track_inventory, default: true)
      t.string(:unit, default: "pcs")

      t.timestamps
    end
  end
end
