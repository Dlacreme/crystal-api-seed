module Seed::Middlewares
  class DBMiddleware < Kemal::Handler
    def call(context)
      call_next context
    end
  end
end
