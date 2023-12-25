require 'rails_helper'

RSpec.describe AccuweatherService, type: :service do

  it "#current_data" do
    VCR.use_cassette("accuweather_service") do
      expect(AccuweatherService.new.current_data).to be_ok
    end
  end

  it "#historical_data" do
    VCR.use_cassette("accuweather_service") do
      expect(AccuweatherService.new.historical_data).to be_ok
    end
  end

end