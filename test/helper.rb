require 'test/unit'
require 'pathname'

require 'shoulda'
require 'matchy'
require 'mocha'
require 'fakeweb'
require 'vcr'

require 'redgreen'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'transparency_data'
config = YAML.load_file(File.dirname(__FILE__) + '/../key.yml')
TransparencyData.api_key = config['api_key']

class Test::Unit::TestCase
end

#FakeWeb.allow_net_connect = false

VCR.config do |c|
  c.cassette_library_dir = 'test/fixtures/vcr_cassettes'
  c.http_stubbing_library = :fakeweb
  c.default_cassette_options = { :record => :new_episodes }
end