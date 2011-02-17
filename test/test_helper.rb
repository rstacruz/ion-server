$:.push *Dir[File.expand_path('../../lib', __FILE__)]

require 'ion/server'

# Outsource to the Ion tests
root = File.expand_path('../../', Ion::PREFIX)
load File.join(root, 'test/test_helper.rb')

# Server test case
class ServerTestCase < Test::Unit::TestCase
  def client
    @client ||= Ion::Client.new
  end

  #def setup
  #end
end

