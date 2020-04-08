module Seed::Middlewares
  class AuthMiddleware < Kemal::Handler
    def call(context)
      return call_next context if context.request.headers.has_key?("Authorization") == false || context.request.headers["Authorization"] == ""
      user_id = Services::JWT.decode(context.request.headers["Authorization"].split(' ')[1])
      return call_next context if user_id.nil?
      context.set("user_id", user_id.to_s)
      if !context.params.json.nil?
        context.params.json["created_by_id"] = user_id.as(String)
      end
      call_next context
    end
  end
end
