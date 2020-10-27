#!/usr/bin/env ruby


# case move
# when move == "1" then @board[0][0] = "x"
# when move == "2" then @board[0][1] = "x"
# when move == "3" then @board[0][2] = "x"
# when move == "4" then @board[1][0] = "x"
# when move == "5" then @board[1][1] = "x"
# when move == "6" then @board[1][2] = "x"
# when move == "7" then @board[2][0] = "x"
# when move == "8" then @board[2][1] = "x"
# when move == "9" then @board[2][2] = "x"
#   # else player_tur


# def create_board
#   board = [
#     ["1", "2", "3"],
#     ["4", "5", "6"],
#     ["7", "8", "9"]
#   ]


#   board.each_with_index do |value, index|
#     puts "#{value}"
#   end


#   test = [
#     [board[0][0] = "x"],
#     [board[0][1] = "x"],
#     [board[0][2] = "x"]
#   ]
#   puts

#   board.each_with_index do |value, index|
#     puts "#{value}"
#   end

# p test

# end

# test = [
#   [board[0][0] = "x"],
#   [board[0][1] = "x"],
#   [board[0][2] = "x"]
# ]

create_board



      # @@WIN_CONDITIONS =[
      #   (@board[0][0] == "x" && @board[0][1] == "x" && @board[0][2] == "x") ||
      #   (@board[0][0] == "o" && @board[0][1] == "o" && @board[0][2] == "o") ||

      #   (@board[1][0] == "x" && @board[1][1] == "x" && @board[1][2] == "x") ||
      #   (@board[1][0] == "o" && @board[1][1] == "o" && @board[1][2] == "o") ||

      #   (@board[2][0] == "x" && @board[2][1] == "x" && @board[2][2] == "x") ||
      #   (@board[2][0] == "o" && @board[2][1] == "o" && @board[2][2] == "o") ||

      #   (@board[0][0] == "x" && @board[1][0] == "x" && @board[2][0] == "x") ||
      #   (@board[0][0] == "o" && @board[1][0] == "o" && @board[2][0] == "o") ||

      #   (@board[0][1] == "x" && @board[1][1] == "x" && @board[2][1] == "x") ||
      #   (@board[0][1] == "o" && @board[1][1] == "o" && @board[2][1] == "o") ||

      #   (@board[0][2] == "x" && @board[1][2] == "x" && @board[2][2] == "x") ||
      #   (@board[0][2] == "o" && @board[1][2] == "o" && @board[2][2] == "o") ||

      #   (@board[0][0] == "x" && @board[1][1] == "x" && @board[2][2] == "x") ||
      #   (@board[0][0] == "o" && @board[1][1] == "o" && @board[2][2] == "o") ||

      #   (@board[0][2] == "x" && @board[1][1] == "x" && @board[2][0] == "x") ||
      #   (@board[0][0] == "o" && @board[1][1] == "o" && @board[2][0] == "o")
      # ]