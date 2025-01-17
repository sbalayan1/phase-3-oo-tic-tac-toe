class TicTacToe
    attr_accessor :board

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

    def initialize
        @board = []
        9.times do
            @board << " "
        end
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} " 
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} " 
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} " 
    end

    def input_to_index input
        input.to_i - 1
    end

    def move index, player
        @board[index] = player
    end

    def position_taken? index
        board[index] != ' '
    end

    def valid_move? position
        position.between?(0,8) && !position_taken?(position)
    end

    def turn_count
        board.count {|char| char == "X" || char == "O"}
    end

    def current_player
        if (turn_count + 1) % 2 == 0 
            return 'O'
        else
            return "X"
        end
    end

    def turn
        input = input_to_index gets.chomp
        if valid_move? input
            move input, current_player
            display_board
        else
            turn
        end
    end

    def won?
        WIN_COMBINATIONS.any? do |combo|
            if position_taken?(combo[0]) && board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]]
                return combo
            end
        end

        false
    end

    def full?
        return true unless board.include?(' ')
    end

    def draw?
        full? && !won?
    end

    def over?
        draw? || won?
    end

    def winner
        if won?
            turn_count % 2 == 0 ? "O" : "X"
        end
    end

    def play
        turn until over?
        puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    end

end

# board = TicTacToe.new()
# board.move 0, 'X'
# puts board.board

# require 'pry'

# class TicTacToe 
#     def initialize
#         @board = Array.new(9).fill(" ")
#     end 

#     WIN_COMBINATIONS = [
#         [0,1,2],
#         [3,4,5],
#         [6,7,8],
#         [0,3,6],
#         [1,4,7],
#         [2,5,8], 
#         [0,4,8],
#         [6,4,2] 
#     ]

#     def display_board
#         puts " #{@board[0]} | #{@board[1]} | #{@board[2]} " 
#         puts "-----------"
#         puts " #{@board[3]} | #{@board[4]} | #{@board[5]} " 
#         puts "-----------"
#         puts " #{@board[6]} | #{@board[7]} | #{@board[8]} " 
#     end

#     def input_to_index number
#         number.to_i - 1
#     end 

#     def move index, player
#         @board[index] = player
#     end

#     def position_taken? index
#         @board[index] != ' '
#     end

#     def valid_move? index
#         !position_taken?(index) && index.between?(0,8)
#     end 

#     def turn_count
#         @board.count{|square| square != ' '}
#     end 

#     def current_player
#         turn_count.even? ? 'X' : 'O'
#     end

#     def turn
#         puts 'Please specify a position between 1-9.'
#         user_input = gets.strip
#         index = input_to_index user_input
#         current = current_player

#         if valid_move? index
#             move index, current
#             display_board
#         else
#             turn
#         end
#     end 

#     def won?
#         WIN_COMBINATIONS.any? do |combo|
#             if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
#                 return combo
#             end
#         end 
#     end

#     def full?
#         @board.all? {|i| i != ' '}
#     end 

#     def draw?
#         full? && !won?
#     end 

#     def over?
#         won? || draw?
#     end 

#     def winner
#         won? ? @board[won?[0]] : nil
#     end 
# end

# game = TicTacToe.new
# game.move 0, 'X'
# game.move 1, 'O'
# game.move 2, 'X'
# game.turn_count
# game.move 3, 'O'
# game.turn_count
# game.turn
# game.full?
# game.won?