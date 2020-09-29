class CLI

    def run
        puts ""
        puts "Welcome to the National Park Information Guide"
        puts ""
        puts "Enter state code for a list of parks or'exit' to exit"
        puts ""
        @statecode = gets.strip.downcase
        API.get_parks(@statecode)

    end

end