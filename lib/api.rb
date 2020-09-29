class API

    def self.get_parks(statecode)
        url="https://developer.nps.gov/api/v1/parks?stateCode=#{statecode}&api_key=TjjIaeDlM9uR0w6jbemCAZbIfy4hZc1OTLXVwIEC"
        uri=URI(url)
        response=Net::HTTP.get(uri)

        parks = JSON.parse(response)["data"].each do |p|
            Park.new(full_name: p["fullName"], state_code: p["states"], park_id: p["parkCode"]) if p["fullName"] !=nil
        end
        
        binding.pry

    end
end