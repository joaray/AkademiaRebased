class Game

MAGIC_SQUARE=({A1: 8,B1: 1,C1: 6,A2: 3,B2: 5,C2: 7,A3: 4,B3: 9,C3: 2})

def initialize(board, points_x, points_o)
  @board = board
  @points_x = points_x
  @points_o = points_o
end

def print_board
  puts " | A | B | C |"
  puts " -------------"
  puts "1| #{@board[:A1]} | #{@board[:B1]} | #{@board[:C1]} |"
  puts " -------------"
  puts "2| #{@board[:A2]} | #{@board[:B2]} | #{@board[:C2]} |"
  puts " -------------"
  puts "3| #{@board[:A3]} | #{@board[:B3]} | #{@board[:C3]} |"
  puts " -------------"
end

def x_points_rows?
  row1 = @points_x[:A1] + @points_x[:B1] + @points_x[:C1]
  row2 = @points_x[:A2] + @points_x[:B2] + @points_x[:C2]
  row3 = @points_x[:A3] + @points_x[:B3] + @points_x[:C3]
  row1==15||row2==15||row3==15
end

def x_points_columns?
  column1 = @points_x[:A1] + @points_x[:A2] + @points_x[:A3]
  column2 = @points_x[:B1] + @points_x[:B2] + @points_x[:B3]
  column3 = @points_x[:C1] + @points_x[:C2] + @points_x[:C3]
  column1==15||column2==15||column3==15
end

def x_points_diagonals?
  diagonal1 = @points_x[:A1] + @points_x[:B2] + @points_x[:C3]
  diagonal2 = @points_x[:C1] + @points_x[:B2] + @points_x[:A3]
  diagonal1==15||diagonal2==15
end

def x_victory?
  x_points_rows?||x_points_columns?||x_points_diagonals?
end

def o_points_rows?
  row1 = @points_o[:A1] + @points_o[:B1] + @points_o[:C1]
  row2 = @points_o[:A2] + @points_o[:B2] + @points_o[:C2]
  row3 = @points_o[:A3] + @points_o[:B3] + @points_o[:C3]
  row1==15||row2==15||row3==15
end

def o_points_columns?
  column1 = @points_o[:A1] + @points_o[:A2] + @points_o[:A3]
  column2 = @points_o[:B1] + @points_o[:B2] + @points_o[:B3]
  column3 = @points_x[:C1] + @points_x[:C2] + @points_x[:C3]
  column1==15||column2==15||column3==15
end

def o_points_diagonals?
  diagonal1 = @points_o[:A1] + @points_o[:B2] + @points_o[:C3]
  diagonal2 = @points_o[:C1] + @points_o[:B2] + @points_o[:A3]
  diagonal1==15||diagonal2==15
end

def o_victory?
  o_points_rows?||o_points_columns?||o_points_diagonals?
end

def victory?
  x_victory?||o_victory?
end

def move_x
  input = gets.chomp.upcase!
  if @board[input.to_sym]==" "
    @board[input.to_sym]="X"
    @points_x[input.to_sym]=Game::MAGIC_SQUARE[input.to_sym]
    print_board
  else
    puts "Wrong field, give another"
    move_x
  end
end

def move_o
  input = gets.chomp.upcase!
  if @board[input.to_sym]==" "
    @board[input.to_sym]="O"
    @points_o[input.to_sym]=Game::MAGIC_SQUARE[input.to_sym]
    print_board
  else
    puts "Wrong field, give another"
    move_o
  end
end

def play
  print_board

  i=1
  j=1


  5.times do
    unless victory?
      puts "X-Move #{i}"
      i=i+1
      move_x
      unless victory?||j==5
        puts "O-Move #{j}"
        j=j+1
        move_o
      end
    end
  end

  if x_victory?
    puts "VICTORY!!! THE WINNER IS... X-PLAYER"
  elsif o_victory?
    puts "VICTORY!!! THE WINNER IS... O-PLAYER"
  else
    puts "GAME OVER"
  end

end


end
