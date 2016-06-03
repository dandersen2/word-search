# Word Search Challenge:
######My Solution:

### Puzzle Data Structure
```ruby
puzzle = [
  ["a", "k", "f", "o", "x", "e", "s"],
  ["s", "o", "a", "w", "a", "h", "p"],
  ["i", "t", "c", "k", "e", "t", "n"],
  ["o", "t", "s", "d", "h", "o", "h"],
  ["s", "e", "x", "g", "s", "t", "a"],
  ["u", "r", "p", "i", "w", "e", "u"],
  ["z", "s", "b", "n", "u", "i", "r"]
]
```
*Figure 1*. Representing a word search puzzle as a nested array

This was a solo project with several different releases. A puzzle is given in the form of a nested array with "rows" of single letters. The first release requires finding a given word in a straight line within the puzzle either vertically, horizontally, or diagonally. The word and the puzzle are entered as arguments to the straight_line_include? method in word_search.rb, which calls upon the "vertical?", "horizontal?", and "diag_include?" methods. The horizontal method proved extremely simple, while the vertical method required an extra step. The diagonal word finder method was significantly more involved as it required altering the puzzle quite a bit in order to use the ruby enumerables and built-in array class methods that I want to use.

The next release required finding a word that could be "snaking" throughout the puzzle, meaning that all of the letters in the word only need to appear in the puzzle and be touching in the correct order but that they can be touching horizontally, vertically or diagonally. These are the same rules that the game "Boggle" uses. Each letter in the puzzle can be used only once in any given word. The target word we wanted our algorithm to be able to find was "nighthawks", which starts on the bottom row, in the 4th position of the puzzle we were given.

My solution searches for the first letter of the target word and then creates an array of all of the "neighbors" of those letters on the board. This required recursion because in many cases you will find multiple instances of a series of 2-3 letters on the board using the snaking search, however not all of them contain all the letters of the word. This means that the search method will need to back-track out of the recursion and return to the previous letter and search again until it reaches the end of the target word, or cannot find the sequence anywhere on the board. The result is a boolean return value of true or false, depending on if the word is found or not.

The final release was to create a user-interface within the command-line. My UI displays the puzzle in the terminal and asks the user for a word to be found and responds depending on that word. If the word is found, it will appear highlighted within the puzzle. If the word cannot be found, it will simply say that it cannot find the given word.

###Try My Solution:

To try my word-search solution, download or clone this repo to your computer and run the runner file by typing "ruby runner.rb" in the terminal within the word-search folder. follow the instructions and enter a word to be searched for. Try to find "foxes" or "nighthawks" to test it out. For now the program must be run again each time you wish to make a guess. If I return to this project I will implement a loop(while/until) that will continue allowing guesses until a word has been found or that will allow a user to play until the type 'exit' to quit out of the loop.

[wikipedia word search]: https://en.wikipedia.org/wiki/Word_search

***