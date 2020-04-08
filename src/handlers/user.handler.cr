require "crypto/bcrypt/password"
require "./_handler"
require "../services/jwt"

module Seed::Handlers
  class UserHandler < SeedHandler
    def get_me(context)
      current_user!(context).to_json
    end

    def login(context)
      u = Models::User.query.where { email == body["email"] }.first!
      password = Crypto::Bcrypt::Password.new(u.password.not_nil!)
      not_found!("Invalid credentials") if password.verify(body["password"].as(String))
      u.login.to_json
    end

    def register(context)
      validate_body!([
        {"email", Const::Regex::EMAIL},
      ])
      u = Models::User.new
      u.email = body["email"].as(String)
      u.password = body["password"].as(String)
      u.save!
      login(context)
    end
  end
end
