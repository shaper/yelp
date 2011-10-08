require 'rubygems'
require 'test/unit'
require 'yelpster'
require File.dirname(__FILE__) + '/yelp_helper'

class TestBusinessSearch < Test::Unit::TestCase
  include YelpHelper
  
  def setup
    create_client YelpHelper::API_V2
  end
  
  BUSINESS_LAT = 37.782303
  BUSINESS_LON = -122.484101
  BUSINESS_LOCATION = {
    "cross_streets"=>"24th Ave & 25th Ave",
    "city"=>"San Francisco", 
    "display_address"=>["2308 Clement St", "(b/t 24th Ave & 25th Ave)", "Outer Richmond", "San Francisco, CA 94121"], 
    "geo_accuracy"=>8,
    "neighborhoods"=>["Outer Richmond"], 
    "postal_code"=>"94121", 
    "country_code"=>"US", 
    "address"=>["2308 Clement St"], 
    "coordinate"=>{"latitude"=>37.782303, "longitude"=>-122.484101},
    "state_code"=>"CA"
    }

  def test_bounding_box_search
    request = Yelp::V2::Search::Request::BoundingBox.new(
                :sw_latitude => 37.9,
                :sw_longitude => -122.5,
                :ne_latitude => 37.788022,
                :ne_longitude => -122.399797,
#                :radius => 1,
#                :business_count => 3,
                :term => 'yelp',
                :consumer_key => @consumer_key,
                :consumer_secret => @consumer_secret,
                :token => @token,
                :token_secret => @token_secret)
    response = @client.search(request)
    validate_json_to_ruby_response(response)
  end
  
  def test_geo_point_search
    request = Yelp::V2::Search::Request::GeoPoint.new(:latitude => BUSINESS_LAT,
                                                      :longitude => BUSINESS_LON,
                                                      :consumer_key => @consumer_key,
                                                      :consumer_secret => @consumer_secret,
                                                      :token => @token,
                                                      :token_secret => @token_secret)
    response = @client.search(request)
    validate_json_to_ruby_response(response)
    assert_equal response['businesses'].first["location"], BUSINESS_LOCATION
  end
  
  BUSINESS_ADDRESS = '2308 Clement St'
  
  def test_location_search
    request = Yelp::V2::Search::Request::Location.new(:address => BUSINESS_ADDRESS,
                                                      :city => 'San Francisco',
                                                      :state => 'CA',
                                                      :zipcode => 94121,
                                                      :consumer_key => @consumer_key,
                                                      :consumer_secret => @consumer_secret,
                                                      :token => @token,
                                                      :token_secret => @token_secret)
    response = @client.search(request)
    validate_json_to_ruby_response(response)
    assert_equal response['businesses'].first['location'], BUSINESS_LOCATION
  end
end
  