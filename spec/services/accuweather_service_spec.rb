require 'rails_helper'

RSpec.describe AccuweatherService, type: :service do

  it "#current_weather" do
    VCR.use_cassette("accuweather_service") do
      expect(AccuweatherService.new.current_weather).to be_ok
    end
  end

  it "#historical_weather" do
    VCR.use_cassette("accuweather_service") do
      expect(AccuweatherService.new.historical_weather).to be_ok
    end
  end

end