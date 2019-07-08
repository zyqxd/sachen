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
  validates_presence_of :city
  validates_presence_of :country
  validates_presence_of :line_one
  validates_presence_of :subdivision
end
