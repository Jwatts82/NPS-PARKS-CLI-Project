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
        #binding.pry
        park.description = park_info["description"]
        park.operating_hours = park_info["operatingHours"][0]["standardHours"]
        park.directions = park_info["directionsInfo"]
        park.entrance_fees = park_info["entranceFees"][0]["cost"]
        park.weather = park_info["weatherInfo"]
        park.activities = park_info["activities"][1]["name"]
        park.contacts = park_info["contacts"]["phoneNumbers"][0]["phoneNumber"]
        binding.pry
    end

end

































   