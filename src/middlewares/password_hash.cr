require "crypto/bcrypt"

module Seed::Middlewares
  class PasswordHash < Kemal::Handler
    def call(context)
      return call_next(context) unless context.params.json.has_key?("password")
      context.params.json["password"] = Crypto::Bcrypt.hash_secret(context.params.json["password"].as(String), 10)
      call_next context
    end
  end
end
