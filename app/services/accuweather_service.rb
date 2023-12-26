class AccuweatherService
  def initialize
    @locationkey = 328328
  end

  def current_weather
    HTTParty.get("http://dataservice.accuweather.com/currentconditions/v1/#{@locationkey}?apikey=#{Rails.application.credentials.accuweather.apikey}")
  end

  def historical_weather
    HTTParty.get("http://dataservice.accuweather.com/currentconditions/v1/#{@locationkey}/historical/24?apikey=#{Rails.application.credentials.accuweather.apikey}")
  end
end