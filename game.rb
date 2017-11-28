class Game

board={A1: " ",B1: " ",C1: " ",A2: " ",B2: " ",C2: " ",A3: " ",B3: " ",C3: " "}

def self.print_board(board)
  puts " | A | B | C |"
  puts " -------------"
  puts "1| #{board[:A1]} | #{board[:B1]} | #{board[:C1]} |"
  puts " -------------"
  puts "2| #{board[:A2]} | #{board[:B2]} | #{board[:C2]} |"
  puts " -------------"
  puts "3| #{board[:A3]} | #{board[:B3]} | #{board[:C3]} |"
  puts " -------------"
end

def self.consistent_rows?(board)
  row1 = board[:A1] == board[:B1] && board[:B1] == board[:C1] && board[:A1] != " "
  row2 = board[:A2] == board[:B2] && board[:B2] == board[:C2] && board[:A2] != " "
  row3 = board[:A3] == board[:B3] && board[:B3] == board[:C3] && board[:A3] != " "
  row1||row2||row3
end

def self.consistent_columns?(board)
  column1 = board[:A1]==board[:A2]&&board[:A2]==board[:A3] && board[:A1] != " "
  column2 = board[:B1]==board[:B2]&&board[:B2]==board[:B3] && board[:B1] != " "
  column3 = board[:C1]==board[:C2]&&board[:C2]==board[:C3] && board[:C1] != " "
  column1||column2||column3
end

def self.consistent_diagonals?(board)
  diagonal1 = board[:A1]==board[:B2]&&board[:B2]==board[:C3] && board[:A1] != " "
  diagonal2 = board[:C1]==board[:B2]&&board[:B2]==board[:A3] && board[:C1] != " "
  diagonal1||diagonal2
end

def self.victory?(board)
  consistent_rows?(board)||consistent_columns?(board)||consistent_diagonals?(board)
end

def self.move_x(board)
  input=gets.chomp.upcase
  if board[input.to_sym]==" "
    board[input.to_sym]="X"
    print_board(board)
  else
    puts "Wrong field, give another"
    move_x(board)
  end
end

def self.move_o(board)
  input=gets.chomp.upcase
  if board[input.to_sym]==" "
    board[input.to_sym]="O"
    print_board(board)
  else
    puts "Wrong field, give another"
    move_o(board)
  end
end

def self.play(board)
  print_board(board)

  i=1
  j=1

  5.times do
    unless victory?(board)
      puts "X-Move #{i}"
      i=i+1
      move_x(board)
      unless victory?(board)||j==5
        puts "O-Move #{j}"
        j=j+1
        move_o (board)
      end
    end
  end

  if victory?(board)
    puts "VICTORY"
  else
    puts "GAME OVER"
  end

end

play(board)

end
