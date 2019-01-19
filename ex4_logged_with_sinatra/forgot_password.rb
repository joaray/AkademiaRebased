require 'digest'

def store_new_password(filename, string)
  File.open(filename, "w")
  File.open(filename, "a+") do |file|
    file.puts(string)
  end
end


def hashed_password(user_password)
  salt = (('0'..'9').to_a+(';'..'z').to_a).shuffle.first(20).join
  timestamp = Time.now.to_i.to_s
  hashed_password = Digest::SHA2.new(512).hexdigest(salt+"#"+user_password.to_s+"#"+timestamp)
  salt+":"+hashed_password+":"+timestamp
end

puts "Give a new password"
input = gets.chomp

if input == input.strip
  unless input.to_s.empty?
    puts "Confirm - give the new password again"
    input2 = gets.chomp

    if input == input2
      string =  hashed_password(input2)
      store_new_password("password2.txt",string)
    else
      puts "Password confirmation doesn't match Password"
    end
  else
    puts "Password can't be empty"
  end
else
  puts "Don't use spaces"
end
