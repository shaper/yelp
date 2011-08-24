require 'test/unit'
require 'yelp'

class TestClient < Test::Unit::TestCase
  def test_validation
    # make sure we can do basic client instantiation
    assert_nothing_raised do
      @client = Yelp::Client.new
    end
  end
end
