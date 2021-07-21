require_relative "./player"
require_relative "./board"

class Game

    def initialize
        @current_player_id = 0
        @players = []
        @board = Board.new
    end

    def play
        welcome
        register_players
        display_board
    end

    def welcome
        puts "Let's play a simple Tic-Tac-Toe game in the console"
        puts
    end

    def register_players
        0.upto(1) do |i|
            puts "What is the name of player ##{i + 1}"
            name = gets.chomp
            puts "What 1 letter (or special character) would you like to be your game marker?"
            puts "it can not be '#{@players[0].letter}'" if i == 1 
            letter = gets.chomp

            save_player(name, letter)
        end
    end

    def save_player(name, letter)
        p = Player.new(name, letter)
        @players.push(p)
    end

    def display_board
        puts 
        puts @board.board
        puts
    end
end

Game.new.play