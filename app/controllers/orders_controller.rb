# app/controllers/orders_controller.rb
class OrdersController < ApplicationController
  def create
    order_repo = CoffeeStore::Infrastructure::InMemoryOrderRepo.new
    place_order = CoffeeStore::UseCases::PlaceOrder.new(order_repo)

    items = params[:items].map do |item_params|
      CoffeeStore::Entities::Item.new(
        id: SecureRandom.uuid,
        name: item_params[:name],
        price: item_params[:price]
      )
    end

    order = place_order.execute(items: items)
    render json: { order_id: order.id, total_price: order.total_price }, status: :created
  end
end
