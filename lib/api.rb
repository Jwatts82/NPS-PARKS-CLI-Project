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
end

































   # def self.get_parks(park)
        #url="https://developer.nps.gov/api/v1/parks?parkCode=#{park_code}&api_key=9Qigg4wXDLD1x4frk4UXJEeeTDEbjXbSd5jN9QeK"
        #uri=URI(url)
        #response=Net::HTTP.get(uri)
        #park_info = JSON.parse(response)["data"]
        #park.hours = park_info["operatingHours"]
        #park.directions = park_info["directionsUrl"]
        #park.activities = park_info["activities"]
        #park.description = park_info["description"]
        #park.contacts = park_info["contacts"]
    #end