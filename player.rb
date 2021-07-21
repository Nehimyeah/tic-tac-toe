class Player
    attr_accessor :name, :letter
    attr_reader :moves

    def initialize(name, letter)
        @moves = []
        self.name = name
        self.letter = letter
    end

    def add_move(move)
        @moves.push(move)
    end
end