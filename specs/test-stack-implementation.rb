require 'minitest/autorun'
require 'minitest/reporters'
require_relative '../lib/Stack'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe "Test Stack Implementation" do
  it "creates a Stack" do
    s = Stack.new
    s.class.must_equal Stack
  end

  it "pushes something onto a empty Stack" do
    s = Stack.new
    s.push(10)
    s.to_s.must_equal "[10]"
  end

  it "pushes multiple somethings onto a Stack" do
    s = Stack.new
    s.push(10)
    s.push(20)
    s.push(30)
    s.to_s.must_equal "[10, 20, 30]"
  end

  it "starts the size of a Stack at 0" do
    s = Stack.new
    s.size.must_equal 0
    s.empty?.must_equal true
  end

  it "removes something from the stack" do
    s = Stack.new
    s.push(5)
    removed = s.pop
    removed.must_equal 5
    s.size.must_equal 0
    s.empty?.must_equal true
  end

  it "removes the right something (LIFO)" do
    s = Stack.new
    s.push(5)
    s.push(3)
    s.push(7)
    removed = s.pop
    removed.must_equal 7
    s.size.must_equal 2
    s.to_s.must_equal "[5, 3]"
  end

  it "properly adjusts the size with pushing and poping" do
    s = Stack.new
    s.empty?.must_equal true
    s.push(-1)
    s.push(-60)
    s.size.must_equal 2
    s.empty?.must_equal false
    s.pop
    s.size.must_equal 1
    s.pop
    s.size.must_equal 0
    s.empty?.must_equal true
  end

  it "returns the top element on the stack" do
    s = Stack.new
    s.push(40)
    s.push(22)
    s.top.must_equal 22
  end

  it "doesn't alter the size when you call top" do
    s = Stack.new
    s.push(8)
    s.top
    s.size.must_equal 1
  end

  it "raises an error if you try to pop from an empty stack" do
    s = Stack.new
    s.empty?.must_equal true

    proc {
      s.pop
    }.must_raise ArgumentError

  end

  it "raises an error if you try to call top on an empty stack" do
    s = Stack.new
    s.empty?.must_equal true

    proc {
      s.top
    }.must_raise ArgumentError
  end


  # Challege Tests you could write yourself:
  # it "doesn't alter the size when you call top" do
  # it "raises an error if you try to pop from an empty stack" do
  # it "raises an error if you try to call top on an empty stack" do
end
