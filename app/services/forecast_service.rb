class ForecastService

    def initialize(lat:, lon:, units: "imperial")
        @lat   = lat
        @lon   = lon
        @units = units 
    end
    
    def self.call(lat, lon)
        response = HTTParty.get("https://api.openweathermap.org")
        JSON.parse(response.body)
    end

    res = response.get('data/2.5/weather', {
        appid: Rails.application.credentials.open_weathermap_api_key,
        lat: lat,
        lon: lon,
        units: units
    })
end    