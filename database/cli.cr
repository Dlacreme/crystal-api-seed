require "clear/cli"

require "../config/env"
require "../config/database"
require "./migrations/*"
require "./seed"
require "../src/models/*"

Clear::CLI.run
