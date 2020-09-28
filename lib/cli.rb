class CLI

    def run
        puts ""
        puts "Welcome to the Park Information Guide"
        puts ""
        puts "Enter state code for a list of parks or'exit' to exit"
        puts ""
        @statecode = gets.strip.downcase
        
    end

end