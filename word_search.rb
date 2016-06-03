require 'pry'

puzzle =           [
                    ["a", "k", "f", "o", "x", "e", "s"],
                    ["s", "o", "a", "w", "a", "h", "p"],
                    ["i", "t", "c", "k", "e", "t", "n"],
                    ["o", "t", "s", "d", "h", "o", "h"],
                    ["s", "e", "x", "g", "s", "t", "a"],
                    ["u", "r", "p", "i", "w", "e", "u"],
                    ["z", "s", "b", "n", "u", "i", "r"]
                   ]

def shifter(puzzle, direction)
  shifted_puzzle = []
  if direction == "right"
    puzzle.each { |row| shifted_puzzle << row.dup }
    shifted_puzzle.each_with_index do |row, index|
      (6 - index).times {row.unshift(nil)}
      index.times {row << nil}
    end
  elsif direction == "left"
    puzzle.each { |row| shifted_puzzle << row.dup }
    shifted_puzzle.each_with_index do |row, index|
      (6 - index).times {row << nil}
      index.times {row.unshift(nil)}
    end
  end
  shifted_puzzle
end

def diag_include?(word, puzzle)
  horizontal?(word, shifter(puzzle, "right")) || horizontal?(word, shifter(puzzle, "left")) || vertical?(word, shifter(puzzle, "right")) || vertical?(word, shifter(puzzle, "left"))
end

def horizontal?(word, puzzle)
  puzzle.select { |row| row.join.include?(word) || row.join.reverse.include?(word) }.any?
end

def vertical?(word, puzzle)
  puzzle.transpose.select { |row| row.join.include?(word) || row.join.reverse.include?(word) }.any?
end

def straight_line_include?(word, puzzle)
  horizontal?(word, puzzle) || vertical?(word, puzzle) || diag_include?(word, puzzle)
end

def print_results(word, puzzle)
  return "Found '#{word}' horizontally!" if horizontal?(word, puzzle)
  return "Found '#{word}' vertically!" if vertical?(word, puzzle)
  return "found '#{word}' diagonally!" if diag_include?(word, puzzle)
  return "found '#{word}' snaking!" if snaking_include?(word, puzzle)
  return "'#{word}' not found..."
end

# __________________________________________________________
# SNAKING WORD FINDER METHODS BELOW THIS LINE:

def puzzle_buffer(puzzle)
  array = []
  puzzle[0].length.times {array << "!"}
  puzzle.unshift(array)
  puzzle << array
  puzzle.each do |row|
    row.unshift("!")
    row << "!"
  end
  puzzle[puzzle.length - 1].pop(2)
  puzzle
end

def puzzle_buffer(puzzle)
  array = []
  puzzle[0].length.times {array << " "}
  puzzle.unshift(array)
  puzzle << array
  puzzle.each do |row|
    row.unshift(" ")
    row << " "
  end
  puzzle[puzzle.length - 1].pop(2)
  puzzle
end


def index_finder(target_letter, puzzle)
  indexes = []
  puzzle.each_with_index do |row, row_index|
    row.each_with_index do |letter, letter_index|
      if letter == target_letter
        indexes << [row_index, letter_index]
      end
    end
  end
  indexes
end

def list_neighbors(coordinates, puzzle)
  row = coordinates[0]
  column =  coordinates[1]
  neighbors = [ [row-1, column-1],
                [row-1, column],
                [row-1, column+1],
                [row, column-1],
                [row, column+1],
                [row+1, column-1],
                [row+1, column],
                [row+1, column+1] ]
  neighbors
end

def snake_finder(target_word, puzzle, found_letters, current_letter_index, potentials_indexes)
  if found_letters.join == target_word
    return true
  else
    potentials_indexes.each do |index|
      next_moves = list_neighbors(index, puzzle).select { |location| puzzle[location[0]][location[1]] == target_word[current_letter_index + 1]}
      if next_moves.any?
        found_letters << puzzle[index[0]][index[1]]
        puzzle[index[0]][index[1]] = nil
        return snake_finder(target_word, puzzle, found_letters, current_letter_index + 1, next_moves)
        break if found_letters.join == target_word
      end
    end
  end
end

def snaking_include?(word, puzzle)
  if snake_finder( word, puzzle_buffer(puzzle), [], 0, index_finder(word[0], puzzle) ) == true
    return true
  else
    return false
  end
end
