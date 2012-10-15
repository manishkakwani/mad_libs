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
  a, b, str_dup = str_dup.partition(/\(\(.*?\)\)/)
  blank_words << b.delete('(())') 
end

puts "OK, let's do this thing!"
puts

substituted_words = {} 
blank_words.each do |word|
  puts "Give me #{word}:"
  substituted_words[word] = gets.chomp
end

puts "Here's the final paragraph.  Laugh it up!"
puts

while string.include?('))')
  a, b, c = string.partition(/\(\(.*?\)\)/)
  b.delete!('(())') 
  string = a + substituted_words[b] + c 
end

puts string
