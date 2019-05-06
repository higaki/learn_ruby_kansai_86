def ex
  result = yield
  $stderr.puts :success
  result
ensure
  $stderr.puts :ensure
end

puts ex{1 + 1}
puts ex{1 + "1"}
