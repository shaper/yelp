require 'yelp/request'

class Yelp
  module Neighborhood
    module Request
      class Base < Yelp::Request
        def base_url
          'http://api.yelp.com/neighborhood_search'
        end
      end
    end
  end
end
