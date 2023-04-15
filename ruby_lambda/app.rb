require 'stringio'

module LambdaFunction
  class Handler
    def self.process(event:, context:)
      'Hello from Ruby 3.1 container image!'
    end
  end
end
