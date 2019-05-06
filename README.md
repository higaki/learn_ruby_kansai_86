# Ruby初級者向けレッスン 70回 (第86回 Ruby関西 勉強会)
## 例外

### 演習問題1
いろいろな例外を発生させてみよう

```ruby
def ex
  yield
rescue
  "#{$!} (#{$!.class})"
end

ex{1.to_sym} # => "undefined method `to_sym' for 1:Fixnum (NoMethodError)"
ex{1 + "1"}  # => "String can't be coerced into Fixnum (TypeError)"
```

[回答例](https://github.com/higaki/learn_ruby_kansai_86/blob/master/ex1.rb)

### 演習問題2
いろいろな例外を捕捉してみよう

- `KeyError` を捕捉しよう
- `StopIteration` も捕捉しよう

```ruby
def ex
  yield
rescue ...

end
```

### 演習問題3
以下のコードをデバッグしてみよう

- どんな例外が発生するか
- 本当は何をしたかったのか
- 修正してみよう

```ruby
[0..9].map{|i| i * 2}
```

### 演習問題4
ensure 節で return すると どうなるか調べよう

```ruby
def ex
  result = yield
  $stderr.puts :success
  result
ensure
  $stderr.puts :ensure  # ここで return すると ...
end
```
