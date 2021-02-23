require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = Rails.root.join 'test', 'vcr_cassettes'
  config.hook_into :webmock
  config.ignore_localhost = true
  config.allow_http_connections_when_no_cassette = false
  config.filter_sensitive_data("{MARVEL_PRIVATE_API_KEY}"){ ENV.fetch("MARVEL_PRIVATE_API_KEY") }
  config.filter_sensitive_data("{MARVEL_API_KEY}"){ ENV.fetch("MARVEL_API_KEY") }
end
