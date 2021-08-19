require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  let(:create_product) {
    @product = FactoryBot.build(:product)
    @product.save
  }

  it "Lists all products" do
    create_product
    get '/products', params: {page: 1, per_page: 5}

    products = JSON.parse(response.body)
    expect(response.status).to eq 200
  end

  it "Details products" do
    create_product
    get "/products/#{@product.id}"

    products = JSON.parse(response.body)
    expect(response.status).to eq 200
  end
end
