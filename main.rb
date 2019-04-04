require_relative 'number_to_words.rb'

print 'Enter number: '
number = gets.chomp
num = NumberToWords.new(number)
num.get_words
num.word_combos.each_with_index { |i, index| puts "#{index + 1} - #{i}" }
