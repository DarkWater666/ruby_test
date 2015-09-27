def palindrome?(string)
  return false if string.size == 0
  string = string.downcase.scan(/\w/)
  string == string.reverse
end
