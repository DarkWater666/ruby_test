def combine_anagrams(words)
  return false if words.size == 0
  words.group_by { |word| word.downcase.chars.sort }.values
end
