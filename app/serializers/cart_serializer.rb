class CartSerializer < ActiveModel::Serializer
  attributes :id, :user, :total_cart_price

  has_many :cart_items, serializer: CartItemsSerializer

  def user
    object.user
  end
end
