# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

Accuweather::API.compile!
run Accuweather::API

run Rails.application
Rails.application.load_server
