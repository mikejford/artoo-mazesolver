require 'artoo/adaptors/adaptor'

module Artoo
  module Adaptors
    # Connect to a mazesolver device
    # @see device documentation for more information
    class Mazesolver < Adaptor
      finalizer :finalize
      attr_reader :mazesolver

      # Closes connection with device if connected
      # @return [Boolean]
      def finalize
        disconnect if connected?
      end

      # Creates a connection with device
      # @return [Boolean]
      def connect
        require 'mazesolver/mazesolver' unless defined?(::Mazesolver)
        require 'mazesolver/maze' unless defined?(::Maze)
        @mazesolver = ::Mazesolver.new(::Maze.new)
        super
      end

      # Closes connection with device
      # @return [Boolean]
      def disconnect
        super
      end

      # Uses method missing to call device actions
      # @see device documentation
      def method_missing(method_name, *arguments, &block)
        mazesolver.send(method_name, *arguments, &block)
      end
    end
  end
end
