require 'rubygems'
require 'rake'
require 'echoe'
$:.unshift(File.dirname(__FILE__) + "/lib")
require 'yelpster'

Echoe.new('yelpster', Yelp::VERSION) do |p|
  p.author = 'Naveed Siddiqui'
  p.email = 'naveed@10eighteen.com'
  p.url = 'https://github.com/nvd/yelpster'
  p.summary = 'An object-oriented interface to the Yelp Developer API.'
  p.description = <<EDOC
Extension of Korman's Ruby wrapper to interface with Yelp's REST API described in detail at:

http://www.yelp.com/developers/getting_started
EDOC
  p.ignore_pattern = ["tmp/*", "script/*"]
  p.runtime_dependencies = [ 'json >=1.1.1', 'oauth >=0.4.5' ]
end
