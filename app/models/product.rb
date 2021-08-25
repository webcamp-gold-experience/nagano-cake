class Product < ApplicationRecord
  require 'miyabi'

  enum sales_status: {on_sale: 0, stop_sale: 1}

  attachment :image
  belongs_to :genre

  has_many :customers, through: :cart_products
  
  has_many :order_products
  has_many :orders, through: :order_products


  def include_tax
    self.price*1.10
  end

  def self.looks(words)
    @products = Product.where("conversion_name LIKE ?", "%#{words}%")
  end
end