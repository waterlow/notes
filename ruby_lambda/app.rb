require 'stringio'

module LambdaFunction
  class Handler
    def self.process(event:, context:)
      [event, context, RUBY_VERSION]
    end
  end
end
