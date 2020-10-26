#!/usr/bin/env ruby

class Player
  attr_accessor :player_board

  def initialize(name)
    @name = name

  end

  def player_board(move)
    @player_board = [
      ["1", "2", "3"],
      ["4", "5", "6"],
      ["7", "8", "9"]
    ]

  end

end

class Board
  def initialize
    create_board

  end

  def create_board
    @board = [
      ["1", "2", "3"],
      ["4", "5", "6"],
      ["7", "8", "9"]
    ]
    # board = [
    #   ["|-|", "|-|", "|-|"],
    #   ["|-|", "|-|", "|-|"],
    #   ["|-|", "|-|", "|-|"]
    # ]

    puts "Initializing Tic Tac Toe Game..."
    puts "Select a number to play:"
    puts

    @board.each_with_index do |value, index|
      puts "#{value} "
    end
  end

  def update_board

  end

end


class Match

  @@WIN_CONDITIONS = [


  ]

  # print "Insert name P1:"
  # player1_name = gets.chomp.to_s
  # puts "P1 name is: #{player1_name}"
  # player1 = Player.new(player1_name)

  # print "Insert name P2:"
  # player2_name = gets.chomp.to_s
  # puts "P2 name is: #{player2_name}"
  # player2 = Player.new(player2_name)

  game = Board.new

  def player_turn
    winner = false

    while winner == false

      puts "Insert a number from 1 to 9 to play that spot."
      move = player1.gets.chomp

      case move
      when move == "1" then move = [0][0]
      when move == "2" then move = [0][1]
      when move == "3" then move = [0][2]
      when move == "4" then move = [1][0]
      when move == "5" then move = [1][1]
      when move == "6" then move = [1][2]
      when move == "7" then move = [2][0]
      when move == "8" then move = [2][1]
      when move == "9" then move = [2][2]
      else player_turn
      end
    end
  end


  def process_move(move)

  end

end

Match.new





# puts board.length
# puts board[2][0]
# p board
