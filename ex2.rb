# 素直に実装してみた
def ex
  yield
rescue KeyError
  "#{$!} (#{$!.class})"
rescue StopIteration
  "#{$!} (#{$!.class})"
end

# 例外が発生しなければ、ブロックの評価値が返る
ex{1 + 1}                       # => 2

# KeyError の捕捉
ex{{}.fetch(:ex)}               # => "key not found: :ex (KeyError)"

# StopIteration の捕捉
ex{[].each.next}                # => "iteration reached an end (StopIteration)"

# KeyError, StopIteration 以外は捕捉できない
ex{1 + "1"}

# ~> -:20:in `+': String can't be coerced into Integer (TypeError)
# ~> 	from -:20:in `block in <main>'
# ~> 	from -:3:in `ex'
# ~> 	from -:20:in `<main>'
