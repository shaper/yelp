require 'rubygems'
require 'test/unit'
require 'yelpster'
require File.dirname(__FILE__) + '/yelp_helper'

class TestPhoneSearch < Test::Unit::TestCase
  include YelpHelper

  def setup
    create_client YelpHelper::API_V1
  end

  GORDO_PHONE_NUMBER = '4155666011'

  def test_phone_search
    request = Yelp::V1::Phone::Request::Number.new(:phone_number => GORDO_PHONE_NUMBER, :yws_id => @yws_id)
    response = @client.search(request)
    validate_json_to_ruby_response(response)
  end
end
