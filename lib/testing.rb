require 'json'
require 'open-uri'
require "pry-byebug"

url = "https://raw.githubusercontent.com/dwyl/english-words/master/words_dictionary.json"
word_serialized = URI.open(url).read
word = JSON.parse(word_serialized)
# binding.pry
puts "type in the center letter"
puts "<"
center_letter = gets.chomp
puts "type in the other letters"
puts "<"
other_letters = gets.chomp
filtered_words = []
letters = center_letter + other_letters
word.each_key do |key|
  if (key.include? center_letter) && (/^[#{letters}]{4,}$/ === key)
    filtered_words << key
  end
end
puts "total number of words: #{filtered_words.length}"
puts filtered_words
