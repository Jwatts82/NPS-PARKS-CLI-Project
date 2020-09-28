class API

    def self.get_park(statecode)
        url="https://developer.nps.gov/api/v1/parks?stateCode=#{statecode}&api_key=YP5zmvUMoWkW6XahA7tHFuQ3mU0jNysAXpybKrzc"
        uri=URI(url)
        response=Net::HTTP.get(uri)
        
        #campgrounds =JSON.parse(response)
        #binding.pry
    #end
end