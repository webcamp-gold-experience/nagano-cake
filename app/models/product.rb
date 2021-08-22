class Product < ApplicationRecord

  enum sales_status: {on_sale: 0, stop_sale: 1}

  attachment :image
  belongs_to :genre

  def include_tax
    self.price*1.10
  end

  has_many :customers, through: :cart_products

  has_many :orders, hrough: :order_products
  
end