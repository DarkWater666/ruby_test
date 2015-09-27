class String
  def palindrome?
    return false if size == 0
    self.downcase!.gsub! /\W+/, ''
    self == reverse
  end
end

module Enumerable
  def palindrome?
    to_a == to_a.reverse
  end
end
