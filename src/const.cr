module Seed::Const
  module Message
    server_error = "Server error - error has been logged"
  end

  module Regex
    EMAIL    = /^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$/
    PASSWORD = /(?=.*[a-z])/
  end

  module Env
    SECRET = "SEED_SECRET"
  end
end
