class Game
attr_accessor :board
SIZE = 30

  def initialize(board)
    @board = board
  end

  def self.input_board(input)
    if input == nil
      @board = r_board
    else
      @board = params_board(input)
    end
  end


  def self.empty_board
    Array.new(SIZE){Array.new(SIZE,0)}
  end

  def self.params_array(input)
    i=0
    params_array=[]
    input.each do |cell|
      if cell=="1"
        cell=1
      elsif input[i+1]=="OFF"||input[i+1]==nil
          cell=0
      else
          cell=cell
      end
      params_array<<cell
      i=i+1
    end
    params_array.delete("OFF")
    params_array
  end

  def self.params_board(input)
    params_board = Array.new(SIZE){Array.new}
    i = 0
    params_array = params_array(input)
    params_board.each do |row|
      params_array[i..i+SIZE-1].each do |cell|
        row<<cell
      end
      i = i+SIZE
    end
    params_board
  end

  def self.r_board
    top_bottom = Array.new(SIZE*10,0)
    zeros = Array.new(10,0)

    r1 = zeros+Array.new(3,1)+Array.new(4,0)+Array.new(3,1)+zeros
    r2 = zeros+Array.new(3,1)+Array.new(2,0)+Array.new(5,1)+zeros
    r3 = zeros+Array.new(3,1)+Array.new(1,0)+Array.new(6,1)+zeros
    r4 = zeros+Array.new(6,1)+Array.new(4,0)+zeros
    r5 = zeros+Array.new(4,1)+Array.new(6,0)+zeros

    top_r = r1+r2+r3+r4+r5
    bottom_r = zeros+Array.new(3,1)+Array.new(7,0)+zeros

    board = top_bottom+top_r+bottom_r*5+top_bottom
    start_board = Array.new(SIZE){Array.new}
    i = 0
    start_board.each do |row|
      board[i..i+SIZE-1].each do |cell|
        row<<cell
      end
      i = i+SIZE
    end
    start_board
  end

  def self.neighbours(i,j)
    size = SIZE-1
    if i != 0 && j != 0 && i != size && j != size
      neighbours = [@board[i-1][j-1],@board[i-1][j],@board[i-1][j+1],@board[i][j-1],@board[i][j+1],@board[i+1][j-1],@board[i+1][j],@board[i+1][j+1]]
    elsif i == 0 && j != 0  && j != size
      neighbours = [@board[i][j-1],@board[i][j+1],@board[i+1][j-1],@board[i+1][j],@board[i+1][j+1]]
    elsif i == size && j != 0 && j != size
      neighbours = [@board[i-1][j-1],@board[i-1][j],@board[i-1][j+1],@board[i][j-1],@board[i][j+1]]
    elsif j == 0 && i != 0 && i != size
      neighbours = [@board[i-1][j],@board[i-1][j+1],@board[i][j+1],@board[i+1][j],@board[i+1][j+1]]
    elsif j == size && i != 0 && i != size
      neighbours = [@board[i-1][j-1],@board[i-1][j],@board[i][j-1],@board[i+1][j-1],@board[i+1][j]]
    elsif i == 0 && j == 0
      neighbours = [@board[i][j+1],@board[i+1][j],@board[i+1][j+1]]
    elsif i == size && j == size
      neighbours = [@board[i-1][j-1],@board[i-1][j],@board[i][j-1]]
    elsif i == 0 && j == size
      neighbours = [@board[i][j-1],@board[i+1][j-1],@board[i+1][j]]
    else
      neighbours = [@board[i-1][j],@board[i-1][j+1],@board[i][j+1]]
    end
  end

  def self.all_sum_neigbours
    all_sum_neigbours = []
    i = 0
    @board.each do |row|
      j= 0
      row.each do |cell|
        sum_neigbours = {}
        sum_neigbours[cell] = neighbours(i,j).sum
        all_sum_neigbours << sum_neigbours
        j=j+1
      end
      i=i+1
    end
    all_sum_neigbours
  end

  def self.decision
    decision = []
    all_sum_neigbours.each do |hash|
      hash.each do |key, value|
        if key == 0
          if value == 3
            decision<<1
          else
            decision<<0
          end
        else
          if value == 2 || value == 3
            decision<<1
          else
            decision<<0
          end
        end
      end
    end
    decision
  end

  def self.new_board
    new_board = Array.new(SIZE){Array.new}
    i = 0
    new_board.each do |row|
      decision[i..i+SIZE-1].each do |cell|
        row<<cell
      end
      i = i+SIZE
    end
    @board = new_board
  end

end
