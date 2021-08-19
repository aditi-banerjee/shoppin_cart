class Product < ApplicationRecord
  #
  ##Associations
  #
  has_many :cart_items, dependent: :destroy
  has_many :carts, through: :cart_items

  #
  ## Validations
  #
  validates :name, :price, presence: true
end
