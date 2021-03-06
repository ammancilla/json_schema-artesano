require 'bundler/setup'
require 'json_schema/artesano'

RSpec.configure do |config|
  config.example_status_persistence_file_path = ".rspec_status"

  config.disable_monkey_patching!
  config.filter_run_when_matching :focus
  config.order = :random

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def support_sketch(name)
  schema_path = File.expand_path("../support/#{name}.json", __FILE__)
  JSON.parse( File.read(schema_path) )
end
