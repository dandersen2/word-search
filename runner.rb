require_relative 'word_search'
require_relative 'colored'

puzzle = [
  ["a", "k", "f", "o", "x", "e", "s"],
  ["s", "o", "a", "w", "a", "h", "p"],
  ["i", "t", "c", "k", "e", "t", "n"],
  ["o", "t", "s", "d", "h", "o", "h"],
  ["s", "e", "x", "g", "s", "t", "a"],
  ["u", "r", "p", "i", "w", "e", "u"],
  ["z", "s", "b", "n", "u", "i", "r"]
]

def word_search_game(puzzle)
  puts "Here is your puzzle:".yellow
  cloned_puzzle = []
  puzzle.each { |row| cloned_puzzle << row.dup }
  puzzle.each do |row|
    string = row.flat_map { |x| [x, "      "] }[0...-1].join
    puts string.magenta
    puts
  end
  puts "Please enter a word to search for:".yellow
  word = gets.chomp
  puts "Searching for #{word}...".green
  sleep(0.5)
  puts "..."
  sleep(0.5)
  puts "..."
  sleep(0.5)
  puts "..."
  puzzle_buffer(cloned_puzzle)
  if snaking_include?(word, puzzle) == true
    puts "Word Found!".green
    cloned_puzzle.each_with_index do |row, row_index|
      row.each_with_index do |letter, letter_index|
        if puzzle[row_index][letter_index] == nil
          cloned_puzzle[row_index][letter_index] = cloned_puzzle[row_index][letter_index].upcase
        end
      end
    end
    printable_rows = []
    cloned_puzzle.each do |row|
      printable_rows << row.flat_map { |x| [x, "    "] }[0...-1].join
    end

    printable_rows.each do |row|
      row.split().each do |i|
        if i===i.capitalize then
          print "   " + i.green + "   "
        else
          print "   " + i.magenta + "   "
        end
      end
      puts
      puts
    end
    puts
  else
    puts "Can't find that word, sorry.".red
  end
end

word_search_game(puzzle)
