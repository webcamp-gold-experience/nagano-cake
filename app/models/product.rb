class Product < ApplicationRecord
 
  enum sales_status: {"販売中": 0, "販売停止中": 1}

  attachment :image
  belongs_to :genre
end
