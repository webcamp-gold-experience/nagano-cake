class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product
  
    enum production_status: {
    no_start: 0,
    waiting_for_production: 1,
    during_production: 2,
    production_completed: 3
  }
  
end
