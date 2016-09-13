require 'socket'

def reset_screen
  clear_screen
  move_to_home
end

# Clears the content on the screen. Ah, a fresh canvas.
def clear_screen
  print "\e[2J"
end

# Moves the insert point in the terminal back to the upper left.
def move_to_home
  print "\e[H"
end

puts "enter username"
username = gets.chomp

server_connection = TCPSocket.new('127.0.0.1', 2000)
while input = gets.chomp
  break if input =~ /quit/
  server_connection.puts"#{username}: #{input}"
  puts server_connection.gets
end

server_connection.close

