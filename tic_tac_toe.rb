# Tic tac toe game
class Board
  attr_accessor :positions, :player

  def initialize
    @positions = Array.new(3) { Array.new(3, '-') }
    @x_index = 0
    @y_index = 0
    @count = 0
    @symbol = ""
    @player = 'Player One'
    puts "\nNew tic tac toe board has been created"
    print_board
  end

  def print_board
    puts
    positions.each do |row|
      puts row.join(' ')
    end
  end

  def player_move
    puts "\n#{@player}'s turn"
    puts 'Enter x-coordinate of your move'
    @x_index = gets.chomp.to_i
    puts 'Enter y-coordinate of your move'
    @y_index = gets.chomp.to_i
  end

  def valid_move?
    if !(@x_index.between?(0, 2) && @y_index.between?(0, 2))
      puts "\nThat position does not exist on the board"
      false
    elsif positions[@x_index][@y_index] == '-'
      true
    else
      puts "\nThat position is already taken. Please try again"
      false
    end
  end

  def update_board
    @symbol = @player == 'Player One' ? 'X' : 'O'
    positions[@x_index][@y_index] = @symbol
  end

  def swap_player
    @player = @player == 'Player One' ? 'Player Two' : 'Player One'
  end

  def outcome_game?
    @count += 1
    if win_condition?
      puts "\n#{@player} has won!"
      true
    elsif @count == 9
      puts "\nIt's a draw!"
      true
    else
      swap_player
      false
    end
  end

  def win_condition?
    if positions[0][0] == positions[0][1] && positions[0][1] == positions[0][2] && (positions[0][0] == 'X' || positions[0][0] == 'O')
      true
    elsif positions[1][0] == positions[1][1] && positions[1][1] == positions[1][2] && (positions[1][0] == 'X' || positions[1][0] == 'O')
      true
    elsif positions[2][0] == positions[2][1] && positions[2][1] == positions[2][2] && (positions[2][0] == 'X' || positions[2][0] == 'O')
      true
    elsif positions[0][0] == positions[1][0] && positions[1][0] == positions[2][0] && (positions[0][0] == 'X' || positions[0][0] == 'O')
      true
    elsif positions[0][1] == positions[1][1] && positions[1][1] == positions[2][1] && (positions[0][1] == 'X' || positions[0][1] == 'O')
      true
    elsif positions[0][2] == positions[1][2] && positions[1][2] == positions[2][2] && (positions[0][2] == 'X' || positions[0][2] == 'O')
      true
    elsif positions[0][0] == positions[1][1] && positions[1][1] == positions[2][2] && (positions[1][1] == 'X' || positions[1][1] == 'O')
      true
    elsif positions[0][2] == positions[1][1] && positions[1][1] == positions[2][0] && (positions[1][1] == 'X' || positions[1][1] == 'O')
      true
    else
      false
    end
  end
end

board_current = Board.new

loop do
  loop do
    board_current.player_move
    break if board_current.valid_move?
  end
  board_current.update_board
  board_current.print_board
  break if board_current.outcome_game?
end
