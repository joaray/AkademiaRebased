require 'test/unit'
require_relative 'game'

class TestGame<Test::Unit::TestCase

test "row_1" do
  board={A1: "4",B1: "4",C1: "4",A2: "1",B2: "2",C2: "3 ",A3: "1",B3: "2",C3: "3"}
  assert Game.consistent_rows?(board), "The result is as it should"
end

test "row_2" do
  board={A1: "1",B1: "2",C1: "3",A2: "4",B2: "4",C2: "4",A3: "1",B3: "2",C3: "3"}
  assert Game.consistent_rows?(board), "The result is as it should"
end

test "row_3" do
  board={A1: "1",B1: "2",C1: "3",A2: "1",B2: "2",C2: "3",A3: "4",B3: "4",C3: "4"}
  assert Game.consistent_rows?(board), "The result is as it should"
end

test "column_1" do
  board={A1: "4",B1: "1",C1: "3",A2: "4",B2: "2",C2: "3 ",A3: "4",B3: "3",C3: "3"}
  assert Game.consistent_columns?(board), "The result is as it should"
end

test "column_2" do
  board={A1: "1",B1: "4",C1: "1",A2: "2",B2: "4",C2: "2",A3: "3",B3: "4",C3: "3"}
  assert Game.consistent_columns?(board), "The result is as it should"
end

test "column_3" do
  board={A1: "1",B1: "1",C1: "4",A2: "2",B2: "2",C2: "4",A3: "3",B3: "3",C3: "4"}
  assert Game.consistent_columns?(board), "The result is as it should"
end
end
