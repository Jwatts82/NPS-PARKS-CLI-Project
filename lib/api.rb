class API

    def self.get_parks(state_code)
        binding.pry
        key=ENV["API_KEY"].split('=')[1]
        url="https://developer.nps.gov/api/v1/parks?stateCode=#{state_code}&api_key=#{key}"
        uri=URI(url)
        response=Net::HTTP.get(uri)

        parks=JSON.parse(response)["data"].each do |p|
            Park.new(full_name: p["fullName"], park_id: p["parkCode"], state_code: state_code) if p["fullName"] !=nil
        end

    end
end

































   