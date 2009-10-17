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
  self.description = 'An object-oriented interface to the Yelp Developer API.'
  self.url = 'http://rubyforge.org/projects/yelp'
  self.changes = p.paragraphs_of('History.txt', 0..1).join("\n\n")
  self.remote_rdoc_dir = '' # Release to root
end
