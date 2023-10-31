class WeatherForecastsController < AppliciationController

    def index
        session[:address] = params[:address]
        if params[:address]
             begin
                @address = params[:address]
                @geocode = GeocodeService.call(@address)
                @cache = "#{@geocode.postal_code}"
                @cache_present = Rails.cache.exist?(@cache)
                if @cache_present
                    @weather = Rails.cache.fetch(@cache, expires_in: 30.minutes) do
                        ForecastService.call(@geocode.lat, @geocode.lon)
                    end
                end
            rescue StandardError => e
                puts "Unable to process"
            end
        end
    end
end