class User < ApplicationRecord
  #
  ##Associations
  #
  has_many :carts, dependent: :destroy
  has_many :cart_items, through: :carts
  has_many :orders

  #
  ##authenticate
  #
  has_secure_password

  #
  ##Callbacks
  #
  after_create :create_active_cart

  def create_active_cart
    self.carts.create
  end

  #
  ## Validations
  #
  validates :name, :email, :password_digest, presence: true
  validates :email, uniqueness: { case_sensitive: false }, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
end
