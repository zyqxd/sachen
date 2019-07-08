# frozen_string_literal: true

# == Schema Information
#
# Table name: prices
#
#  id             :bigint           not null, primary key
#  effective_from :date             not null
#  price          :decimal(, )      not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  product_id     :bigint           not null
#
# Indexes
#
#  index_prices_on_effective_from_and_product_id  (effective_from,product_id) UNIQUE
#  index_prices_on_product_id                     (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#

class Price < ApplicationRecord
  belongs_to :product

  validates :effective_from, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
end
