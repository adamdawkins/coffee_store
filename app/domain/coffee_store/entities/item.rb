# app/domain/coffee_store/entities/item.rb
module CoffeeStore
  module Entities
    class Item
      attr_reader :id, :name, :price

      def initialize(id:, name:, price:)
        @id = id
        @name = name
        @price = price
      end
    end
  end
end
