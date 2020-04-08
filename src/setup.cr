require "../config/env"
require "../config/database"

module Seed::Setup
  extend self

  def all
    self.middleware
    self.serve_static_file
    self.set_kemal_error
  end

  def middleware
    # Run kemal as an API
    add_handler Middlewares::APIMiddleware.new
    # Crypt potential password
    add_handler Middlewares::PasswordHash.new
    # Provide easy access to our database
    add_handler Middlewares::DBMiddleware.new
    # Check user authentication and set CurrentUser
    add_handler Middlewares::AuthMiddleware.new
    # Allow user to access specific routes
    add_handler Middlewares::PublicRouteMiddleware.new
  end

  def serve_static_file
    static_headers do |response, filepath, filestat|
      if filepath =~ /\.html$/
        response.headers.add("Access-Control-Allow-Origin", "*")
      end
      response.headers.add("Content-Size", filestat.size.to_s)
    end
  end

  def set_kemal_error
    error 404 { {"error": "Not found"}.to_json }
    error 401 { {"error": "Unauthorized"}.to_json }
    error 500 { {"error": "Server error"}.to_json }
  end
end
