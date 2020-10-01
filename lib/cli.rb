class CLI
    STATES=["AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]
    def run
        puts "Welcome to the National Parks Services Site Finder".yellow
        #`say "Welcome to the National Parks Services Site Finder"`
        puts ""
        puts "Enter a state code for a list of national parks service sites or type 'exit' to exit".yellow
        #`say "Enter a state code for a list of national parks service sites or type 'exit' to exit"`
        puts ""
        @state_code = gets.strip.downcase
        if @state_code != 'exit'
            !STATES.include?(@state_code.upcase) do
                puts "That is not a state code, please enter a state code for a list of parks or type 'exit' to exit".red
                @state_code = gets.strip.downcase
            end
            API.get_parks(@state_code)
            print_parks
            prompt
            input = gets.strip.downcase
        else
            input = @state_code
        end
        while input != 'exit' do
            if input == 'state code'
                #`say "Enter a state code for a list of parks or type 'exit' to exit"`
                puts "Enter a state code for a list of parks or type 'exit' to exit".yellow
                @state_code = gets.strip.downcase
                while !STATES.include?(@state_code.upcase) do
                    puts "That is not a state code, please enter a state code for a list of parks or type 'exit' to exit".red
                    @state_code = gets.strip.downcase
                end
                API.get_parks(@state_code) if Park.find_by_state_code(@state_code).length == 0
                print_parks
            elsif input.to_i > 0 && input.to_i <= Park.find_by_state_code(@state_code).length
                park = Park.find_by_state_code(@state_code)[input.to_i-1]
                API.get_park(park) if !park.directions
                print_park(park)
                puts ""
                puts "Currently Selected State Code's National Parks Services Sites:".magenta
                puts ""
                print_parks
            else 
                puts "Sorry but I do not understand.  Please try again.".red
               # `say "Sorry but I do not understand. Please try again"`
            end
            prompt
            input = gets.strip.downcase
        end
        puts "Thanks for using my app!".bold
        puts "See you soon".bold
        #`say "Thanks for using my app!, See you soon"`
    end
    
    def prompt
        puts ""
        #`say "Enter a number to see park information, type 'state code' to see another list or type 'exit' to exit"`
        puts "Enter a number to see park information, type 'state code' to see another list or type 'exit' to exit".yellow
        puts ""
    end

    def print_parks
        Park.find_by_state_code(@state_code).each.with_index(1) do |p, i| 
            puts "#{i}. #{p.full_name}" 
        end
    end

    def print_park(park)
        puts ""
        puts park.full_name.magenta.bold
        puts ""
        puts "Description:".green.bold
        puts ""
        puts park.description
        puts ""
        puts "Operating Hours:".green.bold
        puts ""
        puts "Monday: #{park.operating_hours["monday"]}"
        puts "Tuesday: #{park.operating_hours["tuesday"]}"
        puts "Wednesday: #{park.operating_hours["wednesday"]}"
        puts "Thursday: #{park.operating_hours["thursday"]}"
        puts "Friday: #{park.operating_hours["friday"]}"
        puts "Saturday: #{park.operating_hours["saturday"]}"
        puts "Sunday: #{park.operating_hours["sunday"]}"
        puts ""
        puts "Entrance Fee:".green.bold
        puts park.entrance_fees
        puts ""
        puts "Weather:".green.bold
        puts ""
        puts park.weather
        puts ""
        puts "Directions".green.bold
        puts ""
        puts park.directions
        puts ""
        puts "Contact Information:".green.bold
        puts park.contacts
        puts ""
        puts ""
    end

end
        
       
        

