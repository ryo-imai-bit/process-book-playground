require "socket"

# prefork server

number_of_workers = 3
listening_socket = TCPServer.open(12345)

number_of_workers.times do
  pid = fork

  if pid
    next
  else
    loop do
      p "accepting..."
      socket = listening_socket.accept
      p "accepted!"
    
      loop do
        line = socket.gets
        line.gsub!(/[\r\n]/, "")
    
        if line == "exit"
          socket.close
          p "closed a connection"
          break
        end
    
        p line
      end
    end
  end
end

Process.waitall
listening_socket.close

