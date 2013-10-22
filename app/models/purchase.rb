class Purchase < ActiveRecord::Base

  belongs_to :item

  after_save :reduce_stock_of_item

  def reduce_stock_of_item
    self.item.reduce_stock!
  end

  def cost
    if mega_important?
      0
    else
      item.price
    end
  end
end
