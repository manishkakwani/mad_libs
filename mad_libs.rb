puts "Please enter a paragraph, with words you want to substitute written like this: \"((part of speech))\".  Or just press Enter for a sample Mad Lib:"
entry = gets.chomp
if entry.empty?
  string = "I had a ((an adjective)) sandwich for lunch today.  It dripped all over my ((a body part)) and ((a noun))."
else
  string = entry
end

blank_words = []
str_dup = string.dup
while str_dup.include?('))')
  a, b, str_dup = str_dup.partition("((")
  word_in_parens, d, str_dup = str_dup.partition("))")
  blank_words << word_in_parens
end

puts "OK, let's do this thing!"
puts

substituted_words = [] 
blank_words.each_with_index do |word, i|
  puts "Give me #{word}:"
  substitution = gets.chomp
  substituted_words[i] = substitution
end

puts "Here's the final paragraph.  Laugh it up!"
puts

while string.include?('))')
  a, b, c = string.partition("((")
  sub_word = substituted_words[0]
  string = a + sub_word + c
 
  d, e, f = string.partition("))")
  word_to_remove_begin = d.rindex(sub_word) + sub_word.length 
  word_to_remove = d.slice(word_to_remove_begin, d.length) 
  d = d.sub(word_to_remove, "")
  string = d + f
  
  substituted_words.shift
end

puts string
