require 'socket'

server = TCPServer.new(2000)

message_array = []

loop do
  Thread.start(server.accept) do |connection|
    while line = connection.gets.chomp
      break if line =~ /quit/
      message_array << line
      # line_array << line
      # line_array.each do |line1|
      connection.puts(message_array.join("\n"))

      #end
    end
    connection.close
  end

end




