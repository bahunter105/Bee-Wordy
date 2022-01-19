require 'json'
require 'open-uri'
require 'pry-byebug'
require 'dotenv'
Dotenv.load
# binding.pry
puts 'definition to lookup'
lookup = gets.chomp
url = "https://dictionaryapi.com/api/v3/references/collegiate/json/#{lookup}?key=#{ENV['DICTIONARY_API_KEY']}"
word_def_serialized = URI.open(url).read
word_def = JSON.parse(word_def_serialized)
if word_def[0].nil? || word_def[0]['shortdef'].nil?
  p 'this word does not exist'
else
  print word_def[0]['shortdef']
end
