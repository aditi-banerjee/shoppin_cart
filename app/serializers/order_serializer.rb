class OrderSerializer < ActiveModel::Serializer
  attributes :id, :user, :order_details

  def user
    object.user
  end

  def order_details
    CartSerializer.new(object.cart)
  end
end
