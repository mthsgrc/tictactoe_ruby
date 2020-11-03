#!/usr/bin/env ruby
require "pry"

class Match
  attr_reader :player1, :player2, :WIN_CONDITIONS, :board

  def initialize
    print "Insert name of P1: "
    player1 = gets.chomp.to_s
    @player1 = Player.new(player1, "X")
    print "Insert name of P2: "
    player2 = gets.chomp.to_s
    @player2 = Player.new(player2, "O")
    puts "Let's begin..."
    puts
    @board = Board.new
    @WIN_CONDITIONS = false
    player_turns
  end

  def player_turns
    @moves = 0

    play_order = who_first

    # binding.pry

    while @WIN_CONDITIONS == false
      for player in play_order
        move = 0
        until (move >= 1 && move <= 9) && check_move(move) == true
          puts "#{player.name}'s turn, with #{player.signal}."
          print "Select a tile with the matching number: "
          move = gets.chomp.to_i

          # binding.pry
        end
        @board.update_board(player, move)
        @moves += 1
        if check_victory(player) == true
          puts "WINNER is #{player.name} with #{player.signal}."
          puts
          play_again?
        elsif @moves == 9
          puts"That's a DRAW!..."
          puts
          play_again?
        end
      end
    end
  end

  def who_first
  	if [1, 2].sample == 1
  		return [@player1, @player2]
  	else
  		return [@player2, @player1]
  	end
  end

  def check_move(move)
    case move
    when 1 then @board.tiles[0][0] == "| #{1} |" ? true : false
    when 2 then @board.tiles[0][1] == "| #{2} |" ? true : false
    when 3 then @board.tiles[0][2] == "| #{3} |" ? true : false
    when 4 then @board.tiles[2][0] == "| #{4} |" ? true : false
    when 5 then @board.tiles[2][1] == "| #{5} |" ? true : false
    when 6 then @board.tiles[2][2] == "| #{6} |" ? true : false
    when 7 then @board.tiles[4][0] == "| #{7} |" ? true : false
    when 8 then @board.tiles[4][1] == "| #{8} |" ? true : false
    when 9 then @board.tiles[4][2] == "| #{9} |" ? true : false

    else return true
    end
  end
end

def play_again?
  response = ""
  while response != "Y" && response != "N"
    puts "Want to play again? [Y/N]"
    response = gets.chomp
  end
  if response == "Y"
    puts
    @board.new_board
    player_turns
  elsif response == "N"
    exit
  end
end

def check_victory(player)
  @WIN_CONDITIONS =
    (@board.tiles[0][0] == "| #{player.signal} |" && @board.tiles[0][1] == "| #{player.signal} |" && @board.tiles[0][2] == "| #{player.signal} |") ||
    (@board.tiles[2][0] == "| #{player.signal} |" && @board.tiles[2][1] == "| #{player.signal} |" && @board.tiles[2][2] == "| #{player.signal} |") ||
    (@board.tiles[4][0] == "| #{player.signal} |" && @board.tiles[4][1] == "| #{player.signal} |" && @board.tiles[4][2] == "| #{player.signal} |") ||
    (@board.tiles[0][0] == "| #{player.signal} |" && @board.tiles[2][0] == "| #{player.signal} |" && @board.tiles[4][0] == "| #{player.signal} |") ||
    (@board.tiles[0][1] == "| #{player.signal} |" && @board.tiles[2][1] == "| #{player.signal} |" && @board.tiles[4][1] == "| #{player.signal} |") ||
    (@board.tiles[0][2] == "| #{player.signal} |" && @board.tiles[2][2] == "| #{player.signal} |" && @board.tiles[4][2] == "| #{player.signal} |") ||
    (@board.tiles[0][0] == "| #{player.signal} |" && @board.tiles[2][1] == "| #{player.signal} |" && @board.tiles[4][2] == "| #{player.signal} |") ||
    (@board.tiles[0][2] == "| #{player.signal} |" && @board.tiles[2][1] == "| #{player.signal} |" && @board.tiles[4][0] == "| #{player.signal} |")

  @WIN_CONDITIONS
end


class Player
  attr_reader :name, :signal
  def initialize(name, signal)
    @name = name
    @signal = signal
  end
end


class Board
  attr_accessor :tiles

  def initialize
    new_board
  end

  def new_board
    @tiles = [
      ["| #{1} |", "| #{2} |", "| #{3} |"], #[0][0], [0][1], [0][2]
      ["|---|","|---|","|---|"],
      ["| #{4} |", "| #{5} |", "| #{6} |"], #[2][0], [2][1], [2][2]
      ["|---|","|---|","|---|"],
      ["| #{7} |", "| #{8} |", "| #{9} |"]	#[4][0], [4][1], [4][2]
    ]
    # @tiles.each do |value|
    #   puts "#{value}"
    # end
    for tile in @tiles
    	for item in tile
    		print item
    	end
    	puts
      # binding.pry
    end
  end

  def update_board(player, move)
    case move
    when 1 then self.tiles[0][0] = "| #{player.signal} |"
    when 2 then self.tiles[0][1] = "| #{player.signal} |"
    when 3 then self.tiles[0][2] = "| #{player.signal} |"
    when 4 then self.tiles[2][0] = "| #{player.signal} |"
    when 5 then self.tiles[2][1] = "| #{player.signal} |"
    when 6 then self.tiles[2][2] = "| #{player.signal} |"
    when 7 then self.tiles[4][0] = "| #{player.signal} |"
    when 8 then self.tiles[4][1] = "| #{player.signal} |"
    when 9 then self.tiles[4][2] = "| #{player.signal} |"
    end
    puts
    for tile in @tiles
    	for item in tile
    		print item
    	end
    	puts
      # binding.pry
    end
  end
end

Match.new
