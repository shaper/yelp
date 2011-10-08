require 'rubygems'
require 'test/unit'
require 'yelpster'

require File.dirname(__FILE__) + '/yelp_helper'

class TestBusinessRetrieve < Test::Unit::TestCase
  include YelpHelper

  def setup
    create_client YelpHelper::API_V2
  end
  
  CHOCOLATE_SF_ID = 'chocolate-san-francisco'
  
  def test_id_retrieval
    request = Yelp::V2::Business::Request::Id.new(
                :yelp_business_id => "pjb2WMwa0AfK3L-dWimO8w",
                :consumer_key => @consumer_key,
                :consumer_secret => @consumer_secret,
                :token => @token,
                :token_secret => @token_secret)
    response = @client.search(request)
    validate_json_to_ruby_business(response)
    assert_equal response['id'], CHOCOLATE_SF_ID
  end
end