#! /usr/bin/env ruby --disable-did_you_mean
def ex
  yield
  nil
rescue Exception => e
  "#{e} (#{e.class})"
end

# Exception
# NoMemoryError
# ScriptError
ex{require 'nothing'} # => "cannot load such file -- nothing (LoadError)"
# NotImplementedError
ex{eval "if"} # => "(eval):1: syntax error, unexpected end-of-input (SyntaxError)"
# SecurityError
ex{system "kill -TERM #{$$}"} # => "SIGTERM (SignalException)"
ex{system "kill -INT #{$$}"}  # => " (Interrupt)"
# StandardError
ex{[].at} # => "wrong number of arguments (given 0, expected 1) (ArgumentError)"
ex{throw :ex} # => "uncaught throw :ex (UncaughtThrowError)"
# EncodingError
ex{"あ" + "い".encode(Encoding::CP932)} # => "incompatible character encodings: UTF-8 and Windows-31J (Encoding::CompatibilityError)"
ex{"環境に依存".encode(Encoding::ISO_2022_JP_2)} # => "code converter not found (UTF-8 to ISO-2022-JP-2) (Encoding::ConverterNotFoundError)"
ex{"あ".force_encoding(Encoding::CP932).encode(Encoding::UTF_8)} # => "incomplete \"\\x82\" on Windows-31J (Encoding::InvalidByteSequenceError)"
ex{"☺".encode(Encoding::CP932)} # => "U+263A from UTF-8 to Windows-31J (Encoding::UndefinedConversionError)"
# FiberError
# IOError
ex{open("/dev/null", &:readline)} # => "end of file reached (EOFError)"
# IndexError
ex{{}.fetch(:none)}           # => "key not found: :none (KeyError)"
ex{[].each.next}              # => "iteration reached an end (StopIteration)"
# LocalJumpError
# Math::DomainError
ex{n + 1} # => "undefined local variable or method `n' for main:Object (NameError)"
ex{1.to_sym} # => "undefined method `to_sym' for 1:Integer (NoMethodError)"
# RangeError
ex{Float::NAN.to_i}           # => "NaN (FloatDomainError)"
# RegexpError
# RuntimeError
# SystemCallError
ex{open 'nothing'} # => "No such file or directory @ rb_sysopen - nothing (Errno::ENOENT)"
# ThreadError
ex{1 + "1"}  # => "String can't be coerced into Integer (TypeError)"
ex{"1" + 1}  # => "no implicit conversion of Integer into String (TypeError)"
ex{1 / 0}    # => "divided by 0 (ZeroDivisionError)"
# SystemExit
# SystemStackError
# fatal
