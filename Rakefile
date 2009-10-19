require 'rubygems'
require 'hoe'
$:.unshift(File.dirname(__FILE__) + "/lib")
require 'yelp'

Hoe.spec('yelp') do |p|
  self.version = Yelp::VERSION
  self.rubyforge_name = 'yelp'
  self.author = 'Walter Korman'
  self.email = 'shaper@fatgoose.com'
  self.extra_deps << [ 'json', '>= 1.1.1' ]
  self.summary = 'An object-oriented interface to the Yelp Developer API.'
  self.description = <<EDOC
The yelp rubygem provides a Ruby object-oriented interface to the Yelp 
REST API described in detail at:

http://www.yelp.com/developers/getting_started
EDOC
  self.url = 'http://rubyforge.org/projects/yelp'
  self.changes = p.paragraphs_of('CHANGELOG.rdoc', 0..1).join("\n\n")
  self.remote_rdoc_dir = '' # Release to root
  self.readme_file = 'README.rdoc'
  self.history_file = 'CHANGELOG.rdoc'
  self.extra_rdoc_files = [ 'CHANGELOG.rdoc', 'README.rdoc' ]
end
