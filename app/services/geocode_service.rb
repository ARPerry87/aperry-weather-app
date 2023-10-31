class GeocodeService
    def self.call(address)
        response = Geocoder.search(address)
        response.length > 0
        data = response.first.data
        geocode = OpenStruct.new
        geocode.lat = data["lat"].round(2)
        geocode.lon = data["lon"].round(2)
        geocode.country_code = data["address"]["country_code"]
        geocode.postal_code = data["address"]["postcode"]
        geocode
    end
end