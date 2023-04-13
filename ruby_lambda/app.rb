module LambdaFunction
  class Handler
    def self.process(event:,context:)
      'Hello from Ruby 2.7 container image!'
    end
  end
end
