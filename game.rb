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
    end

    def welcome
        puts "Let's play a simple Tic-Tac-Toe game in the console"
        puts
    end
end