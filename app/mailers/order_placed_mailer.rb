class OrderPlacedMailer < ApplicationMailer

  layout 'mailer'
  def order_details(order)
    @order = order
    @user = order.user
    @cart = order.cart
    @cart_items = @cart.cart_items
    mail(to: @user.email, subject: "Order Details")
  end

end
