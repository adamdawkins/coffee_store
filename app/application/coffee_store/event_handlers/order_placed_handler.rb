# app/application/event_handlers/order_placed_handler.rb
module CoffeeStore
  module Application
    class OrderPlacedHandler
      def self.handle(order)
        puts "Order #{order.id} placed with total price: #{order.total_price}"
      end
    end
  end
end

# Subscribe the handler to the event
CoffeeStore::Infrastructure::EventPublisher.subscribe(:order_placed) do |order|
  CoffeeStore::Application::OrderPlacedHandler.handle(order)
end
