class Board

    attr_accessor :board_values
    attr_reader :current_board, :filled_board, :board

    def initialize
        reset
    end

    private
    
    def reset
        @board_values = [1,2,3,4,5,6,7,8,9]
        @filled_board = []
        create_board
        @@winning_combination = [
            [1,2,3],
            [1,4,7],
            [1,5,9],
            [2,5,8],
            [3,6,9],
            [3,5,7],
            [4,5,6],
            [7,8,9]
        ]
    end

    def create_board
        @board = "\t #{@board_values[0]} | #{@board_values[1]} | #{@board_values[2]} \n" +
                 "\t---+---+---\n" + 
                 "\t #{@board_values[3]} | #{@board_values[4]} | #{@board_values[5]} \n" +
                 "\t---+---+---\n" + 
                 "\t #{@board_values[6]} | #{@board_values[7]} | #{@board_values[8]} \n"
    end

    public

    def add_move(letter, index)
        @filled_board.push(index)
        @board_values[index] = letter
        create_board

    end

    def game_over?
        @filled_board.length == @board_values.length
    end

    def won?(user_selections)
        @@winning_combination.each do |combo|
            if combo - user_selections == []
                return true
            end
        end
        false
    end
end