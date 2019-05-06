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
  return
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
# >> F
# >> ===============================================================================
# >> Failure: test_rescue(EnsureTest): <TypeError> exception was expected but none was thrown.
# >> -:26:in `test_rescue'
# >> ===============================================================================
# >> F
# >> ===============================================================================
# >> Failure: test_success(EnsureTest)
# >> -:21:in `test_success'
# >> <2> expected but was
# >> <nil>
# >> ===============================================================================
# >> 
# >> Finished in 0.006131 seconds.
# >> -------------------------------------------------------------------------------
# >> 2 tests, 2 assertions, 2 failures, 0 errors, 0 pendings, 0 omissions, 0 notifications
# >> 0% passed
# >> -------------------------------------------------------------------------------
# >> 326.21 tests/s, 326.21 assertions/s
