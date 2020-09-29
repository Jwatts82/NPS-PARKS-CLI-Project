class API

    def self.get_parks(state_code)
        url="https://developer.nps.gov/api/v1/parks?stateCode=#{state_code}&api_key=TjjIaeDlM9uR0w6jbemCAZbIfy4hZc1OTLXVwIEC"
        uri=URI(url)
        response=Net::HTTP.get(uri)

        parks=JSON.parse(response)["data"].each do |p|
            Park.new(full_name: p["fullName"], park_id: p["parkCode"], state_code: state_code) if p["fullName"] !=nil
        end
        
        binding.pry

    end
end