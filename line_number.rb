#!/usr/bin/env ruby
# frozen_string_literal: true

class LineNumber
  def self.before(lineno, _param)
    puts "line number is #{lineno}"
  end

  def self.after(_param, lineno)
    puts "line number is #{lineno}"
  end
end

print 'before with __LINE__: '
LineNumber.before __LINE__, <<~TEXT
  This is some text.
  As is this.
  This, also, is some text.
TEXT

print 'after with __LINE__: '
LineNumber.after <<~TEXT, __LINE__
  This is some text.
  As is this.
  This, also, is some text.
TEXT

print 'after with __LINE__ + 0: '
LineNumber.after <<~TEXT, __LINE__ + 1
  This is some text.
  As is this.
  This, also, is some text.
TEXT
# fin
