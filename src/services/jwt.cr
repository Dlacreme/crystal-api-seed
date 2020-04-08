require "jwt"

module Seed::Services
  class JWT
    def self.encode(user_id : UUID) : String
      expire_date = Time.utc + 30.days
      ::JWT.encode({
        "user_id" => user_id,
        "expire"  => expire_date.to_unix,
      }, ENV[Const::Env::SECRET], ::JWT::Algorithm::HS256)
    end

    def self.decode(token) : String | Nil
      payload, header = ::JWT.decode(token, ENV[Const::Env::SECRET], ::JWT::Algorithm::HS256)
      return nil if payload["expire"].as_i64 < Time.utc.to_unix
      payload["user_id"].to_s
    rescue
      nil
    end
  end
end
