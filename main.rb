#!/usr/bin/env ruby

# class TicTac

require "pry"

class Match
  attr_reader :player1, :player2, :WIN_CONDITIONS, :board

  def initialize

    print "Insert name of P1: "
    player1 = gets.chomp.to_s
    @player1 = Player.new(player1, "x")

    print "Insert name of P2: "
    player2 = gets.chomp.to_s
    @player2 = Player.new(player2, "o")

    @board = Board.new

    @WIN_CONDITIONS = false


    player_turns

  end

  def player_turns
    # binding.pry
    @moves = 0
    while @WIN_CONDITIONS == false

      for player in [@player1, @player2].sample(2)
        move = 0
        # binding.pry
        until (move >= 1 && move <= 9) && check_move(move) == true
          puts "#{player.name}'s turn, with #{player.signal}."
          print "Select a tile with the matching number: "
          move = gets.chomp.to_i
        end
        move = move.to_s
        @board.update_board(player, move)
        @moves += 1
        if check_victory(player) == true
          puts "WINNER iS #{player.name} with #{player.signal}."
          exit
        elsif @moves == 9
          print "Draw! Try again..."
          puts
          @board.new_board
          player_turns
        end
      end
    end
  end

  def check_move(move)
    # binding.pry
    case move

    when 1 then @board.tiles[0][0] == "1" ? true : false
    when 2 then @board.tiles[0][1] == "2" ? true : false
    when 3 then @board.tiles[0][2] == "3" ? true : false
    when 4 then @board.tiles[1][0] == "4" ? true : false
    when 5 then @board.tiles[1][1] == "5" ? true : false
    when 6 then @board.tiles[1][2] == "6" ? true : false
    when 7 then @board.tiles[2][0] == "7" ? true : false
    when 8 then @board.tiles[2][1] == "8" ? true : false
    when 9 then @board.tiles[2][2] == "9" ? true : false

    else return true
    end
    # binding.pry
  end
end


def check_victory(player)
  # binding.pry
  @WIN_CONDITIONS =
    (@board.tiles[0][0] == player.signal && @board.tiles[0][1] == player.signal && @board.tiles[0][2] == player.signal) ||
    (@board.tiles[1][0] == player.signal && @board.tiles[1][1] == player.signal && @board.tiles[1][2] == player.signal) ||
    (@board.tiles[2][0] == player.signal && @board.tiles[2][1] == player.signal && @board.tiles[2][2] == player.signal) ||
    (@board.tiles[0][0] == player.signal && @board.tiles[1][0] == player.signal && @board.tiles[2][0] == player.signal) ||
    (@board.tiles[0][1] == player.signal && @board.tiles[1][1] == player.signal && @board.tiles[2][1] == player.signal) ||
    (@board.tiles[0][2] == player.signal && @board.tiles[1][2] == player.signal && @board.tiles[2][2] == player.signal) ||
    (@board.tiles[0][0] == player.signal && @board.tiles[1][1] == player.signal && @board.tiles[2][2] == player.signal) ||
    (@board.tiles[0][2] == player.signal && @board.tiles[1][1] == player.signal && @board.tiles[2][0] == player.signal)


  if @WIN_CONDITIONS == true
    # puts "#{player.name} is winner!"
    return true
  end
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
    @tiles = [
      ["1", "2", "3"],
      ["4", "5", "6"],
      ["7", "8", "9"]
    ]
    @tiles.each do |value|
      puts "#{value}"
    end
  end

  def new_board
    @tiles = [
      ["1", "2", "3"],
      ["4", "5", "6"],
      ["7", "8", "9"]
    ]
    @tiles.each do |value|
      puts "#{value}"
    end
  end

  def update_board(player, move)
    # binding.pry
    case move
    when "1" then self.tiles[0][0] = player.signal
    when "2" then self.tiles[0][1] = player.signal
    when "3" then self.tiles[0][2] = player.signal
    when "4" then self.tiles[1][0] = player.signal
    when "5" then self.tiles[1][1] = player.signal
    when "6" then self.tiles[1][2] = player.signal
    when "7" then self.tiles[2][0] = player.signal
    when "8" then self.tiles[2][1] = player.signal
    when "9" then self.tiles[2][2] = player.signal
      # else puts "ERROR"
    end
    # check_victory
    puts
    @tiles.each do |value|
      puts "#{value}"
    end
    puts
  end
end

Match.new
