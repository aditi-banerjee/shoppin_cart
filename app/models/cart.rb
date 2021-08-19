class Cart < ApplicationRecord
  #
  ##Associations
  #
  belongs_to :user
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items
  has_one :order

  def set_cart_total
    self.update(total_cart_price: cart_items.sum(:total_price))
  end
end
