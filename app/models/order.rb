class Order < ApplicationRecord
  enum payment_method: {
    credit_card: 0,
    bank_transfer: 1
  }
  enum order_status: {
    payment_waiting: 0,
    payment_confirmed: 1,
    in_production: 2,
    preparing_delivery: 3,
    delivered: 4
  }

  has_many :order_products
  has_many :products, through: :order_products
end
