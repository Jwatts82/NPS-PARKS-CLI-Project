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
        prompt
        input = gets.strip.downcase
        while input != 'exit' do
            if input == 'state_code'
                @state_code = gets.strip.downcase
                API.get_parks(@state_code) if Park.find_by_state_code(@state_code).length == 0
                print_parks
            elsif input.to_i > 0 && input.to_i <= Park.find_by_state_code(@state_code).length
                park = Park.find_by_state_code(@state_code)[input.to_i-1]
                API.get_park(park) if !park.directions
                print_park(park)
            else 
                puts "Sorry but I do not understand.  Please try again."
            end
            input = gets.strip.downcase
        end
    end
    
    def prompt
        puts ""
        puts "Enter a number for park information, 'state code' to see another list or'exit' to exit"
        puts ""
    end

    def print_parks
        Park.find_by_state_code(@state_code).each.with_index(1) do |p, i| 
            puts "#{i}. #{p.full_name}" 
        end
    end

    def print_park(park)
    #puts going through info
    end

end
        
       
        

