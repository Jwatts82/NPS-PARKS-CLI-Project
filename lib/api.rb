class API

    def self.get_parks(state_code)
        #binding.pry
        key=ENV["API_KEY"].split('=')[1]
        url="https://developer.nps.gov/api/v1/parks?stateCode=#{state_code}&api_key=#{key}"
        uri=URI(url)
        response=Net::HTTP.get(uri)

        parks=JSON.parse(response)["data"].each do |p|
            Park.new(full_name: p["fullName"], park_id: p["parkCode"], state_code: state_code) if p["fullName"] !=nil
        end
    end

    def self.get_park(park)
        key=ENV["API_KEY"].split('=')[1]
        url="https://developer.nps.gov/api/v1/parks?parkCode=#{park.park_id}&api_key=#{key}"
        uri=URI(url)
        response=Net::HTTP.get(uri)
        #binding.pry
        park_info = JSON.parse(response)["data"][0]
        park.description = park_info["description"]
        park.operating_hours = park_info["operatingHours"]
        park.directions = park_info["directionsUrl"]
        park.activities = park_info["activities"]
        park.contacts = park_info["contacts"]
        binding.pry
    end

end

































   