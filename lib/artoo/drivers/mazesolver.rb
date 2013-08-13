require 'artoo/drivers/driver'

module Artoo
  module Drivers
    # The mazesolver driver behaviors
    class Mazesolver < Driver

      COMMANDS = [:up, :down, :left, :right, :current_pos].freeze

      # Start driver and any required connections
      def start_driver
        begin
          every(interval) do
            handle_message_events
          end

          super
        rescue Exception => e
          Logger.error "Error starting Mazesolver driver!"
          Logger.error e.message
          Logger.error e.backtrace.inspect
        end
      end

      def handle_message_events
        while not connection.messages.empty? do
          evt = connection.messages.pop
          case 
          when evt.is_a?(::Mazesolver::SolvedMessage)
            handle_maze_solved(evt)
          when evt.is_a?(::Mazesolver::BlockedMessage)
            handle_blocked(evt)
          end
        end
      end

      private
      
      def handle_maze_solved event
        publish(event_topic_name("solved"), event)
      end
      
      def handle_blocked event
        publish(event_topic_name("blocked"), event)
      end

    end
  end
end
