begin
  require 'bundler'
rescue LoadError
  require 'rubygems'
  require 'bundler'
end

Bundler.setup(:default, :test)

require 'rspec'
require 'grendel'
require 'webmock/rspec'

include WebMock::API

RSpec.configure do |config|
  WebMock.disable_net_connect!

  # helper to add Content-Type: application/json to each request
  def stub_json_request(method, uri, body, headers = {})
    headers = headers.merge("Content-Type" => "application/json")
    status = headers.delete(:status) || 200
    stub_request(method, uri).
      to_return(:body => body, :status => status, :headers => headers)
  end
end
