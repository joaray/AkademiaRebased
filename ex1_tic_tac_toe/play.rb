require_relative 'game'

  @game = Game.new({A1: " ",B1: " ",C1: " ",A2: " ",B2: " ",C2: " ",A3: " ",B3: " ",C3: " "},
                  {A1: 0,B1: 0,C1: 0,A2: 0,B2: 0,C2: 0,A3: 0,B3: 0,C3: 0},
                  {A1: 0,B1: 0,C1: 0,A2: 0,B2: 0,C2: 0,A3: 0,B3: 0,C3: 0})
  @game.play
