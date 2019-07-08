# frozen_string_literal: true

# == Schema Information
#
# Table name: addresses
#
#  id          :bigint           not null, primary key
#  city        :string           not null
#  country     :string           not null
#  line_one    :string           not null
#  line_two    :string
#  postal_code :string
#  subdivision :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Address < ApplicationRecord
  validates :city, presence: true
  validates :country, presence: true
  validates :line_one, presence: true
  validates :subdivision, presence: true
end
