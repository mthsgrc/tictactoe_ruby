#!/usr/bin/env ruby

# class TicTac

require "pry"

class Match
  attr_reader :player1, :player2, :WIN_CONDITIONS

  def initialize
    print "Insert name of P1: "
    player1 = gets.chomp.to_s
    @player1 = Player.new(player1, "x")

    print "Insert name of P2: "
    player2 = gets.chomp.to_s
    @player2 = Player.new(player2, "o")


    @WIN_CONDITIONS = false

    @board = Board.new



    player_turns
  end

  def player_turns
    # binding.pry
    while @WIN_CONDITIONS == false

      move = 0
      until move >= 1 && move <= 9
        print "select a tile with the matching number: "
        move = gets.chomp.to_i
      end
      move = move.to_s
      @board.update_board(@player1, move)
      # binding.pry
      check_victory(@player1)
    end

    puts "There is a winner!"
  end

  def check_victory(player)
    @WIN_CONDITIONS = 
      (@board.tiles[0][0] == player.signal && @board.tiles[0][1] == player.signal && @board.tiles[0][2] == player.signal) ||
      (@board.tiles[1][0] == player.signal && @board.tiles[1][1] == player.signal && @board.tiles[1][2] == player.signal) ||
      (@board.tiles[2][0] == player.signal && @board.tiles[2][1] == player.signal && @board.tiles[2][2] == player.signal) ||
      (@board.tiles[0][0] == player.signal && @board.tiles[1][0] == player.signal && @board.tiles[2][0] == player.signal) ||
      (@board.tiles[0][1] == player.signal && @board.tiles[1][1] == player.signal && @board.tiles[2][1] == player.signal) ||
      (@board.tiles[0][2] == player.signal && @board.tiles[1][2] == player.signal && @board.tiles[2][2] == player.signal) ||
      (@board.tiles[0][0] == player.signal && @board.tiles[1][1] == player.signal && @board.tiles[2][2] == player.signal) ||
      (@board.tiles[0][2] == player.signal && @board.tiles[1][1] == player.signal && @board.tiles[2][0] == player.signal) 

    @WIN_CONDITIONS
    binding.pry
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

    @tiles.each do |value|
      puts "#{value}"
    end
  end
end

Match.new
