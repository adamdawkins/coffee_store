module CoffeeStore
  module Entities
    class Order
      attr_reader :id, :items, :status

      def initialize(id:, items:)
        @id = id
        @items = items
        @status = :new
      end

      def total_price
        items.sum(&:price)
      end

      def complete!
        @status = :completed
      end
    end
  end
end
