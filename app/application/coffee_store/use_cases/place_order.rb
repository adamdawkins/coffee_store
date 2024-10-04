# app/application/place_order.rb
module CoffeeStore
  module UseCases
    class PlaceOrder
      def initialize(order_repo)
        @order_repo = order_repo
      end

      def execute(order_params)
        order = CoffeeStore::Entities::Order.new(
          id: SecureRandom.uuid,
          items: order_params[:items]
        )
        @order_repo.save(order)
        publish_event(:order_placed, order)
        order
      end

      private

      def publish_event(event, payload)
        CoffeeStore::Infrastructure::EventPublisher.publish(event, payload)
      end
    end
  end
end
