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

- [素直に実装](https://github.com/higaki/learn_ruby_kansai_86/blob/a25ecbc3172b5cf09c1c764413dd7db0fc5ff531/ex2.rb)
- [rescue は まとめられる](https://github.com/higaki/learn_ruby_kansai_86/blob/0f222ff959bec0acdd77a5e254ec7c1b7b66429a/ex2.rb)
- [親クラスで ひとまとめに rescue](https://github.com/higaki/learn_ruby_kansai_86/blob/master/ex2.rb)

### 演習問題3
以下のコードをデバッグしてみよう

- どんな例外が発生するか
- 本当は何をしたかったのか
- 修正してみよう

```ruby
[0..9].map{|i| i * 2}
```

[回答例](https://github.com/higaki/learn_ruby_kansai_86/blob/master/ex3.rb)

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

[回答例](https://github.com/higaki/learn_ruby_kansai_86/blob/master/ex4.rb)
