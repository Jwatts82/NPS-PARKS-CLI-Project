class CLI

    def run
        puts ""
        puts "Welcome to the National Park Finder"
        puts ""
        puts "Enter state code for a list of parks or'exit' to exit"
        puts ""
        @state_code = gets.strip.downcase
        API.get_parks(@state_code) 
        print_parks
 
    end
    
    def print_parks
        Park.find_by_state_code(@state_code).each.with_index(1) do |p, i| 
            puts "#{i}. #{p.full_name}" 
        end
    end
    
end
        
       
        

