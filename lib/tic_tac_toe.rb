require 'pry'

class TicTacToe 
    def initialize
        @board = Array.new(9).fill(" ")
    end 

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8], 
        [0,4,8],
        [6,4,2] 
    ]

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} " 
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} " 
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} " 
    end

    def input_to_index number
        number.to_i - 1
    end 

    def move index, player
        @board[index] = player
    end

    def position_taken? index
        @board[index] != ' '
    end

    def valid_move? index
        !position_taken?(index) && index.between?(0,8)
    end 

    def turn_count
        @board.count{|square| square != ' '}
    end 

    def current_player
        turn_count.even? ? 'X' : 'O'
    end

    def turn
        puts 'Please specify a position between 1-9.'
        user_input = gets.strip
        index = input_to_index user_input
        current = current_player

        if valid_move? index
            move index, current
            display_board
        else
            turn
        end
    end 

    def won?
        index_of_player_X = []
        index_of_player_O = []

        @board.each_with_index do |i, index|
            if i == 'X'
                index_of_player_X.push(index)
            elsif i == 'O'
                index_of_player_O.push(index)
            end 
        end 

        WIN_COMBINATIONS.each do |combo|
            
        end 
    end

    def full?
        if @board.count {|i| i == ' '} > 0 
            puts 'false' 
        else 
            puts 'true'
        end 
    end 
end

game = TicTacToe.new
game.move 0, 'X'
game.move 1, 'O'
game.move 2, 'X'
game.turn_count
game.move 3, 'O'
game.turn_count
game.turn
game.full?
game.won?