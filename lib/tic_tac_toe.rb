require 'pry'

class TicTacToe 
    def initialize
        @board = Array.new(9).fill(" ")
        @count = 0
        @current_player = 'X'
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
        position_taken = position_taken? index
        valid_move = valid_move? index

        if position_taken == false && valid_move == true
            @board[index] = player
            @count += 1
            @current_player = player == 'X' ? 'O' : 'X'
        end
        # binding.pry
    end

    def position_taken? index
        if @board[index] == 'X' || @board[index] == 'O'
            true
        else
            false
        end 
    end

    def valid_move? index
        if @board[index] == 'X' || @board[index] == 'O' || index > @board.length - 1 || index < 0
            false
        else
            true
        end
    end 

    def turn_count
        if @count == 0
            @board.each do |i|
                if i=='X' || i=='O'
                    @count +=1
                end 
            end
        end

        @count
    end 

    def current_player
        currentCount = turn_count
        currentCount.times do 
            @current_player = @current_player == 'X' ? 'O' : 'X'
        end

        @current_player
    end
 
end

# game = TicTacToe.new
# game.move 0, 'X'
# game.move 1, 'O'
# game.move 2, 'X'
# game.turn_count
# game.move 3, 'O'
# game.turn_count
