# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)

require 'pry'
require 'zadarma_api'
require 'vcr'

RSpec.configure do |config|
end

VCR.configure do |config|
  config.configure_rspec_metadata!
  config.hook_into :webmock
  config.cassette_library_dir = 'spec/cassettes'

  config.filter_sensitive_data('<API_AUTHORIZATION>') do |interaction|
    interaction.request.headers['Authorization'].first
  end
end
