project_root = File.dirname(File.absolute_path(__FILE__))
require "#{project_root}/../number_to_words.rb"
require 'benchmark'

describe 'Converting phone number to combination of words for' do
  it '6686787825 should include combinations' do
    num = NumberToWords.new('6686787825')
    num.get_words

    expect(num.word_combos.class.name).to be == 'Array'
    expect(num.word_combos).to include('motortruck')
    expect(num.word_combos).to include('motor, truck')
    expect(num.word_combos).to include('motor, usual')
    expect(num.word_combos).to include('noun, struck')
    expect(num.word_combos).to include('not, opt, puck')
  end

  it '2282668687 should include combinations' do
    num = NumberToWords.new('2282668687')
    num.get_words

    expect(num.word_combos).to include('catamounts')
    expect(num.word_combos).to include('acta, mounts')
    expect(num.word_combos).to include('act, amounts')
    expect(num.word_combos).to include('act, contour')
    expect(num.word_combos).to include('cat, boot, our')
  end

  it '1234567890 should raise an error' do
    expect { NumberToWords.new('1234567890') }.to raise_error(StandardError)
  end

  it '346553828332 should raise an error' do
    expect { NumberToWords.new('346553828332') }.to raise_error(StandardError)
  end


  it 'should display the runtime for different inputs' do
    puts
    num_arr = ['2282668687', '6686787825', '3456789234']
    puts "No  UserCpu  SysCpu    Combined  Actual"
    num_arr.each_with_index do |number, index|
      puts "#{index + 1}"
      print Benchmark.measure {
        num = NumberToWords.new(number)
        num.get_words
      }
    end
  end
end
