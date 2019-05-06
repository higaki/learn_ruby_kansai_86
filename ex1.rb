#! /usr/bin/env ruby --disable-did_you_mean
def ex
  yield
  nil
rescue Exception => e
  "#{e} (#{e.class})"
end

puts ex{1.to_sym} # >> "undefined method `to_sym' for 1:Integer (NoMethodError)"
puts ex{1 + "1"}  # >> "String can't be coerced into Integer (TypeError)"
