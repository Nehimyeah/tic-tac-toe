require_relative "./player"
require_relative "./board"

class Game

    def initialize
        reset
    end

    def play
        reset
        welcome
        register_players
        display_board
        start_new
        play if play_again?
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

    def start_new
        while @board.filled_board.length != 9 do
            current_player = @players[@current_player_id]

            puts "#{current_player.name}, please enter a number (1-9)" +
                " that is available to place an 'x'"
            begin 
                user_selection = gets.match(/[0-9]/)[0].to_i
            rescue
                puts "Sorry, this is an invalid answer. Please, try again"
                retry
            else
                if @board.filled_board.include?(user_selection - 1) || user_selection > 9
                    puts "Sorry, this is an invalid answer. Please, try again"
                    next
                end
                current_player.add_move(user_selection)
                @board.add_move(current_player.letter, (user_selection - 1))

            end

            display_board

            if @board.won?(current_player.moves)
                puts "GAME OVER! #{current_player.name} is the winner!"
                break
            end

            switch_players
        end

        puts "It's a draw" if @board.filled_board.length == 9
    end

    def switch_players
        @current_player_id == 0 ? @current_player_id = 1 : @current_player_id = 0
    end

    def play_again?
        puts "Would you like to play a new game? Press 'y' for yes or 'n' for no."
        if gets.chomp.downcase == 'y'
            return true
        end
        false
    end

    def reset        
        @current_player_id = 0
        @players = []
        @board = Board.new
    end
end

Game.new.play