
require 'sinatra'
require 'bundler'
require_relative 'game'


Bundler.require(:default)

require 'sinatra/reloader'

get "/" do
  @game = Game.new(Game.input_board(params[:board_to_show]))
  erb :index
end

post "/" do
  @game = Game.new(Game.input_board(params[:board_to_show]))
  @game = Game.new(Game.new_board)
  erb :index
end

post "/start" do
  @game = Game.new(Game.input_board(params[:board_to_show]))
  redirect "/"
end

post "/clear" do
  @game = Game.new(Game.empty_board)
  erb :index
end
