require 'rubygems'
require 'test/unit'
require 'yelp'
require File.dirname(__FILE__) + '/yelp_helper'

class TestReviewSearch < Test::Unit::TestCase
  include YelpHelper

  def setup
    create_client
  end

  def test_bounding_box
    request = Yelp::Review::Request::BoundingBox.new(
                :bottom_right_latitude => 37.788022,
                :bottom_right_longitude => -122.399797,
                :top_left_latitude => 37.9,
                :top_left_longitude => -122.5,
#                :radius => 1,
#                :business_count => 3,
                :term => 'yelp',
                :yws_id => @yws_id)
    response = @client.search(request)
    validate_json_to_ruby_response(response)
  end

  def test_geo_point
    request = Yelp::Review::Request::GeoPoint.new(
                :latitude => 37.78022,
                :longitude => -122.399797,
                :radius => 2,
#                :business_count => 5,
                :term => 'yelp',
                :yws_id => @yws_id)
    response = @client.search(request)
    validate_json_to_ruby_response(response)
  end
  
  def test_location
    request = Yelp::Review::Request::Location.new(
                :address => '650 Mission St',
                :city => 'San Francisco',
                :state => 'CA',
                :radius => 2,
#                :business_count => 5,
                :term => 'cream puffs',
                :yws_id => @yws_id)
    response = @client.search(request)
    validate_json_to_ruby_response(response)
  end

  def test_category
    # perform a basic search of businesses near SOMA
    request = Yelp::Review::Request::GeoPoint.new(
                :latitude => 37.78022,
                :longitude => -122.399797,
                :radius => 5,
                :term => 'yelp',
                :yws_id => @yws_id)
    response = @client.search(request)

    # perform the same search focusing only on playgrounds
    narrowed_request = Yelp::Review::Request::GeoPoint.new(
                         :latitude => 37.78022,
                         :longitude => -122.399797,
                         :radius => 5,
                         :term => 'yelp',
                         :category => 'playgrounds',
                         :yws_id => @yws_id)
    narrowed_response = @client.search(narrowed_request)

    # make sure we got less for the second
    assert(response['businesses'].length > narrowed_response['businesses'].length)
  end

  def test_json_response_format
    request = basic_request(:response_format => Yelp::ResponseFormat::JSON)
    response = @client.search(request)
    validate_json_response(response)
  end

  def test_json_to_ruby_response_format
    request = basic_request(:response_format => Yelp::ResponseFormat::JSON_TO_RUBY)
    response = @client.search(request)
    validate_json_to_ruby_response(response)
  end

  def test_pickle_response_format
    request = basic_request(:response_format => Yelp::ResponseFormat::PICKLE)
    @client.search(request)
    # TODO: validation
  end

  def test_php_response_format
    request = basic_request(:response_format => Yelp::ResponseFormat::PHP)
    response = @client.search(request)
    # TODO: validation
  end

  def test_compressed_response
    request = basic_request(:compress_response => true)
    response = @client.search(request)
    validate_json_to_ruby_response(response)
  end

  def test_uncompressed_response
    request = basic_request(:compress_response => false)
    response = @client.search(request)
    validate_json_to_ruby_response(response)
  end

  def test_multiple_categories
    # fetch results for only one category
    params = {
      :city => 'San Francisco',
      :state => 'CA',
      :yws_id => @yws_id,
      :category => 'donuts'
    }
    request = Yelp::Review::Request::Location.new(params)
    response = @client.search(request)

    # make sure the overall request looks kosher
    validate_json_to_ruby_response(response)

    # make sure all businesses returned have at least the specified category
    response['businesses'].each do |b|
      cat_exists = b['categories'].find { |c| c['category_filter'] == 'donuts' }
      assert_not_nil(cat_exists)
    end

    # now fetch for businesses with two categories
    params[:category] = [ 'donuts', 'icecream' ]
    request = Yelp::Review::Request::Location.new(params)
    response = @client.search(request)

    # make sure the overall request looks kosher
    validate_json_to_ruby_response(response)

    # make sure we have at least one of each specified category, and
    # that each business has at least one
    donut_count = 0
    icecream_count = 0
    response['businesses'].each do |b|
      has_donut = b['categories'].find { |c| c['category_filter'] == 'donuts' }
      has_icecream = b['categories'].find { |c| c['category_filter'] == 'icecream' }

      donut_count += 1 if has_donut
      icecream_count += 1 if has_icecream

      assert(has_donut || has_icecream)
    end

    assert((donut_count > 0) && (icecream_count > 0))
  end

  protected

    def basic_request (params = nil)
      default_params = {
        :city => 'San Francisco',
        :state => 'CA',
        :term => 'gordo',
        :yws_id => @yws_id
      }
      Yelp::Review::Request::Location.new(default_params.merge(params))
    end
end
