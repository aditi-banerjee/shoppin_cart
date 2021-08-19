class Order < ApplicationRecord
  #
  ##Associations
  #
  belongs_to :user
  belongs_to :cart
end
