def count_words(string)
  return false if string.size == 0
  wstring = string.gsub(/[^a-zA-Z]/, ' ').downcase.split
  wstring.each_with_object(Hash.new(0)) { |word, counts| counts[word] += 1 }
end
