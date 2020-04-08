require "clear"

Clear::SQL.init(ENV["DATABASE_URI"], connection_pool_size: 5)
