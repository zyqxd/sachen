# == Schema Information
#
# Table name: partners
#
#  id                          :bigint           not null, primary key
#  contact                     :string
#  email                       :string
#  name                        :string           not null
#  phone                       :string
#  shipping_account_number     :string
#  shipping_courier            :string
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  billing_address_id          :bigint
#  shipping_address_chinese_id :bigint
#  shipping_address_id         :bigint
#
# Indexes
#
#  index_partners_on_billing_address_id           (billing_address_id)
#  index_partners_on_shipping_address_chinese_id  (shipping_address_chinese_id)
#  index_partners_on_shipping_address_id          (shipping_address_id)
#
# Foreign Keys
#
#  fk_rails_...  (billing_address_id => addresses.id)
#  fk_rails_...  (shipping_address_chinese_id => addresses.id)
#  fk_rails_...  (shipping_address_id => addresses.id)
#

class Partner < ApplicationRecord
  has_one :billing_address
  has_one :shipping_address
  has_one :shipping_address_chinese

  validates_presence_of :name
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
