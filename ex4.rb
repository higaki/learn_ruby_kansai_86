def ex(trace)
  trace << :yield
  result = yield
  trace << :success
  result
rescue
  trace << :rescue
  raise
ensure
  trace << :ensure
end

require 'test/unit'
class EnsureTest < Test::Unit::TestCase
  def setup
    @trace = []
  end

  def test_success
    assert_equal(2, ex(@trace){1 + 1})
    assert_equal([:yield, :success, :ensure], @trace)
  end

  def test_rescue
    assert_raise(TypeError) do
      ex(@trace){1 + "1"}
    end
    assert_equal([:yield, :rescue, :ensure], @trace)
  end
end

# >> Loaded suite -
# >> Started
# >> ..
# >> Finished in 0.000434 seconds.
# >> -------------------------------------------------------------------------------
# >> 2 tests, 4 assertions, 0 failures, 0 errors, 0 pendings, 0 omissions, 0 notifications
# >> 100% passed
# >> -------------------------------------------------------------------------------
# >> 4608.29 tests/s, 9216.59 assertions/s
