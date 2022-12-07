# check if there is any error, if yes, then exit and restart the server

# if no error, then continue

# check if there is any new message, if yes, then continue

class Respawn 
    def initialize
        @respawn = true
    end

    def respawn?
        @respawn
    end

    def respawn
        @respawn = true
    end

    def stop
        @respawn = false
    end

    def debug
        puts @respawn
    end
end