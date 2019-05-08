[![Build Status](https://travis-ci.org/sajinmp/number_to_words.svg?branch=master)](https://travis-ci.org/sajinmp/number_to_words)

# Convert phone number to word combinations
Change phone number to word combinations with words available in dictionary with different sizes with minimum size of each word being 3.

## To run the program

1. Clone the repository.
2. Navigate into the repo.
3. Run `bundle` to install dependencies.
4. Run `rspec` to run tests.
5. Runtime for the conversion will be displayed in the final test.
6. Run `ruby main.rb` in the console.
7. Enter the number to be converted.

The number can first be split into all possible combinations from which every combination in which each combination containing a word size of 3 or more can be selected. Then based on the dictionary, each number combination can be swapped with all possible word combinations.
