require 'socket'

class Server
    def initialize
        @server = TCPServer.new(2000)
        @clients = [@server]
        @messages = []
    end
    
    def start
        loop do
        ready = select(@clients, nil, nil, nil)
        if ready
            ready[0].each do |client|
            if client == @server
                @clients << @server.accept
            else
                message = client.gets.chomp
                @messages << message
                puts message
            end
            end
        end
        end
    end

    def send_message(message)
        @clients.each do |client|
            client.puts message
        end
    end

    def get_messages
        @messages
    end

    def clear_messages
        @messages = []
    end

    def stop
        @server.close
    end

    def get_clients
        @clients
    end
end