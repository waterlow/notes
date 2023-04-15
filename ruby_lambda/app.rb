require 'stringio'

module LambdaFunction
  class Handler
    def self.process(event:, context:)
      [event, context.inspect, RUBY_VERSION]
    end
  end
end
