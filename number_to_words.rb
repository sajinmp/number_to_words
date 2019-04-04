DICTIONARY = File.read('dictionary.txt').split("\n").map(&:downcase).freeze
MAPPING = {2 => ['a', 'b', 'c'], 3 => ['d', 'e', 'f'], 4 => ['g', 'h', 'i'],
           5 => ['j', 'k', 'l'], 6 => ['m', 'n', 'o'], 7 => ['p', 'q', 'r', 's'],
           8 => ['t', 'u', 'v'], 9 => ['w', 'x', 'y', 'z']}.freeze

class NumberToWords
  attr_accessor :number, :combos, :word_combos

  def initialize(number)
    if number.include?('0') || number.include?('1') || number.size > 10
      raise StandardError.new('Has 0, 1 or the size is greater than 10')
    end
    @number = number
    @combos = get_combinations(number).map { |i| i unless (i.map(&:size) & [1, 2]).any? }.compact
  end

  def get_combinations(num)
    return [[]] if num.empty?
    (1..num.length).map { |i| get_combinations(num[i..-1]).map { |j| [num[0, i]] + j } }.inject(&:+)
  end

  def get_words
    words = []

    # arr = ['123', '456']
    combos.each do |arr|
      arr_combos = {}
      arr.map { |i| arr_combos[i] = nil }

      # nos = '123'
      arr.each do |nos|
        possible_combinations = get_possible_words(nos.size, nos.size, nos)
        dict_arr = DICTIONARY & possible_combinations
        arr_combos[nos] = dict_arr
      end

      combo_arr = arr.map { |i| arr_combos[i] }
      words << combo_arr.first.product(*combo_arr[1..-1]).map { |i| i.join(', ') }
    end

    self.word_combos = words.reject(&:empty?).flatten
  end

  def get_possible_words(size_of_nos, size_of_loop, nos)
    return '' unless size_of_loop > 0
    mapping_arr = MAPPING[nos[size_of_nos - size_of_loop].to_i]
    arr = []
    mapping_arr.size.times do |index|
      str = mapping_arr[index]
      nstr = get_possible_words(size_of_nos, size_of_loop - 1, nos)
      if nstr.is_a?(Array)
        arr << nstr.map { |i| str + i }
        arr.flatten!
      else
        str += nstr
      end
      if (size_of_loop == nos.size && mapping_arr.size == index + 1) || str.empty?
        return arr
      elsif size_of_loop == 1
        arr << str
      end
    end
    return arr
  end
end
