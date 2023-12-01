require_relative "b.rb"
require "test/unit"

class TestB < Test::Unit::TestCase
  def test_get_result
    assert_equal(0, get_result(["string1", "string2", "string3"]))
  end
end
