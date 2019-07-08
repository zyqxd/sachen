# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id                :bigint           not null, primary key
#  category          :string           not null
#  code              :string           not null
#  description       :string
#  name              :string           not null
#  pr_customer_field :string
#  reorder_threshold :integer          default(0), not null
#  tax_percent       :decimal(, )
#  taxable           :boolean          default(FALSE)
#  track_inventory   :boolean          default(TRUE)
#  unit              :string           default("pcs")
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Product < ApplicationRecord
  has_many :prices
  has_one :current_price, -> { order(effective_from: :desc).first }, through: :prices

  validates :category, presence: true
  validates :code, presence: true
  validates :name, presence: true
  validates :reorder_threshold, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :tax_percent, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 0 }
end
