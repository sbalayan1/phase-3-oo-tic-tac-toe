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
        number = number.to_i - 1
    end 

    def move index, player
        @board[index] = player
        # binding.pry
    end

    def position_taken? index
        if @board[index] === 'X' || @board[index] === 'O'
            true
        else
            false
        end 
    end

    def valid_move? index
        if @board[index] === 'X' || @board[index] === 'O' || index > @board.length - 1 || index < 0
            false
        else
            true
        end
    end 
end

