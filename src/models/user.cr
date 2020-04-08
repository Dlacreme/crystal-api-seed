module Seed::Models
  class User
    include Clear::Model

    self.table = "users"
    primary_key :id, type: :uuid
    column email : String
    column password : String
    timestamps

    def login : Hash
      {
        "email" => self.email,
        "token" => Services::JWT.encode(self.id.not_nil!),
      }
    end
  end
end
