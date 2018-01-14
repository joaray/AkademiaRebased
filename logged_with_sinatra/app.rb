
require 'sinatra'
require 'bundler'
require 'digest'


Bundler.require(:default)

require 'sinatra/reloader'

enable :sessions

FILE = "password.txt"
SALT = File.read(FILE).split(":").first
TIMESTAMP = File.read(FILE).split(":").last
PASSWORD = read_password


def hashed_password(user_password)
  hashed_password = Digest::SHA2.new(512).hexdigest(SALT+"#"+user_password.to_s+"#"+TIMESTAMP)
  salt+":"+hashed_password+":"+timestamp
end

def read_password
  file = FILE
  return [] unless File.exist?(file)
  File.read(file)
end

get "/" do

  if session[:logged] = false
    @user_password = params[:user_password]
    erb :index
  else
    redirect  "/logged"
  end

end

post "/" do
  @user_password = hashed_password(params[:user_password])

  if @user_password == PASSWORD
    session[:logged] = true
    redirect "/logged"
  else
    redirect "/"
  end
end

get '/logged' do
  if session[:logged]
    erb :logged
  else
    redirect "/"
  end
end

post "/logged" do
  session[:logged] = false
  redirect "/"
end
# myapp.rb
require 'sinatra'
require 'bundler'
require 'digest'


Bundler.require(:default)

require 'sinatra/reloader'

enable :sessions


def hashed_password(user_password)
  salt = "e04430f2a1d2cc02ea82"
  timestamp = "1507282890"
  hashed_password = Digest::SHA2.new(512).hexdigest(salt+"#"+user_password.to_s+"#"+timestamp)
  salt+":"+hashed_password+":"+timestamp
end

def read_password
  file = "password.txt"
  return [] unless File.exist?(file)
  File.read(file).split("\n")[-1]
end

get "/" do
  @state = session[:state]
  if @state != "LOGGED"
    @user_password = params[:user_password]
    @password = read_password
    erb :index
  else
    redirect  "/logged"
  end

end

post "/" do
  @user_password = hashed_password(params[:user_password])
  @password = read_password
  if @user_password == @password
    session[:state] = "LOGGED"
    redirect "/logged"
  else
    redirect "/"
  end
end

get '/logged' do
  @state = session[:state]
  if @state == "LOGGED"
    erb :logged
  else
    redirect "/"
  end
end

post "/logged" do
  session[:state] = "UNLOGGED"
  redirect "/"
end
