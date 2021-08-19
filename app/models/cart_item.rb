class CartItem < ApplicationRecord
  #
  ##Associations
  #
  belongs_to :cart
  belongs_to :product

  def set_total_price
    self.update(total_price: product.price * quantity)
  end
end
