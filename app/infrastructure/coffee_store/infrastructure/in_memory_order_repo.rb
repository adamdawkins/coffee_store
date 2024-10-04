module CoffeeStore
  module Infrastructure
    class InMemoryOrderRepo
      def initialize
        @orders = {}
      end

      def save(order)
        @orders[order.id] = order
      end

      def find_by_id(order_id)
        @orders[order_id]
      end
    end
  end
end

