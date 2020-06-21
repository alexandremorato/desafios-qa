require "cucumber"
require "httparty"
require "rspec"
require_relative "helpers"
require_relative "helpers_requests"

World(Helpers)
World(HelpersRequests)

$token = ENV['TOKEN']

$end_point = 'https://api-v2.idwall.co'