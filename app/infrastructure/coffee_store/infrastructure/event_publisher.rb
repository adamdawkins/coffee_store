module CoffeeStore
  module Infrastructure
    class EventPublisher
      @subscribers = {}

      class << self
        def subscribe(event_name, &block)
          @subscribers[event_name] ||= []
          @subscribers[event_name] << block
        end

        def publish(event_name, payload)
          return unless @subscribers[event_name]

          @subscribers[event_name].each do |handler|
            handler.call(payload)
          end
        end
      end
    end
  end
end
