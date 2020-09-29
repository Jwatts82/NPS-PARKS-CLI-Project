class CLI

    def run
        puts ""
        puts "Welcome to the National Park Finder"
        puts ""
        puts "Enter state code for a list of parks or'exit' to exit"
        puts ""
        @state_code = gets.strip.downcase
        API.get_parks(@state_code) 
        Park.find_by_state_code(@state_code).each.with_index(1) do |p, i| 
            puts "#{i}. #{p.full_name}"   
        end
    end
end
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        



        
        
        
        
        
        
        
        
        #print_parks
        #prompt
        #input = gets.strip.downcase
        #while input != "exit" do
            #if input == "state_code"
            #@state_code = gets.strip.downcase
            #API.get_parks(@state_code)
            #print_drinks if Park.find_by_state_code(@state_code).length == 0
            #elsif input.to_i > 0 && input.to_i <= Park.find_by_state_code(@state_code).length
                #park = Park.find_by_state_code(@state_code)[innput.to_i-1]
                #API.get_parks(park) if !park.state
                #print_drink(park)
                #else
                    #puts "Sorry but I do not understand, please try again."
                #end
                #input = gets.strip.downcase
        #end
        #puts "Thanks for using this great app!"
        #puts "See you soon"

    #def prompt
        #puts ""
        #puts "Enter a number to view park information, 'state code' to see another list or'exit' to exit"
        #puts ""


    #def print_parks
        #Park.find_by_state_code(@state_code).each.with_index(1) do |p, i|
        #puts "#{i}. #{p.full_name}"
    #end

    #def print_park(park)
    #end

