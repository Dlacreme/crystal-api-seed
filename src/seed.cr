require "kemal"
require "option_parser"
require "clear"
require "./const"
require "./services/*"
require "./middlewares/*"
require "./setup"
require "./handlers/*"
require "./models/*"

module Seed
  VERSION = "0.1.0"

  Setup.all

  userHandler = Handlers::UserHandler.new

  get "/me" { |context| userHandler.get_me(context) }
  post "/login" { |context| userHandler.login(context) }
  post "/register" { |context| userHandler.register(context) }

  # Open server
  bind = "0.0.0.0"
  port = 3000

  OptionParser.parse do |opts|
    opts.on("-p PORT", "--port PORT", "define port to run server") do |opt|
      port = opt.to_i
    end
  end

  Kemal.run do |config|
    server = config.server.not_nil!
    server.bind_tcp bind, port
  end
end
