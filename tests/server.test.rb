require 'test/unit'
require_relative '../src/genserver.rb'


class TestServer < Test::Unit::TestCase
  def test_server
    server = Server.new
  end
end