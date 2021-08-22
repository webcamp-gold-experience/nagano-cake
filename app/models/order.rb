class Order < ApplicationRecord
  enum payment_method: {
    credit_card: 0,
    bank_transfer: 1
  }
  
  has_many :order_products
  has_many :products

end