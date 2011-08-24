require 'yelp/client'
require 'yelp/record'
require 'yelp/response_format'
#-----------------V1---------------------------
require 'yelp/v1/request'
require 'yelp/v1/neighborhood/request/base'
require 'yelp/v1/neighborhood/request/geo_point'
require 'yelp/v1/neighborhood/request/location'
require 'yelp/v1/phone/request/number'
require 'yelp/v1/review/request/base'
require 'yelp/v1/review/request/bounding_box'
require 'yelp/v1/review/request/geo_point'
require 'yelp/v1/review/request/location'
#----------------V2----------------------------
require 'yelp/v2/request'
require 'yelp/v2/business/request/id'
require 'yelp/v2/search/request/base'
require 'yelp/v2/search/request/geo_point'
require 'yelp/v2/search/request/bounding_box'
require 'yelp/v2/search/request/location'

class Yelp
  VERSION = '1.1.0'
end
