require 'rubygems'
require 'hoe'
$:.unshift(File.dirname(__FILE__) + "/lib")
require 'yelpster'

Hoe.spec('yelpster') do |p|
  self.version = Yelp::VERSION
  self.rubyforge_name = 'yelpster'
  self.author = 'Naveed Siddiqui'
  self.email = 'naveed@10eighteen.com'
  self.extra_deps << [ 'json', '>= 1.1.1' ]
  self.summary = 'An object-oriented interface to the Yelp Developer API.'
  self.description = <<EDOC
Extension of Korman's Ruby wrapper to interface with Yelp's REST API described in detail at:

http://www.yelp.com/developers/getting_started
EDOC
  self.url = 'https://github.com/nvd/yelpster'
  self.changes = p.paragraphs_of('CHANGELOG.rdoc', 0..1).join("\n\n")
  self.remote_rdoc_dir = '' # Release to root
  self.readme_file = 'README.rdoc'
  self.history_file = 'CHANGELOG.rdoc'
  self.extra_rdoc_files = [ 'CHANGELOG.rdoc', 'README.rdoc' ]
end
