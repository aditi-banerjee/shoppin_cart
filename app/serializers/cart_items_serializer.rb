class CartItemsSerializer < ActiveModel::Serializer
  attributes :id, :item_details

  def item_details
    {
      product: object.product,
      quantity: object.quantity,
      total_price: object.total_price
    }
  end
end
