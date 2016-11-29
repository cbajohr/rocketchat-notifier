require 'test_helper'

class RocketChat::NotifierTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::RocketChat::Notifier::VERSION
  end

  def test_it_does_something_useful
    assert true
  end
end
