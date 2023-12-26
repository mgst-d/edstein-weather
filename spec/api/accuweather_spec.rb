require 'rails_helper'

RSpec.describe "Accuweather API" do

  context "current weather" do
    let(:weather) { Weather.new }
    it 'returns current weather' do
      get '/weather/current' do
        expect(JSON.parse(response.body['time'])).to eq(weather.time).as_json
        expect(JSON.parse(response.body['temperature'])).to eq(weather.temperature).as_json
      end
    end
  end
  context "historical weather" do
    let(:weathers) { Weather.where(time: (Time.now - 1.day)..Time.now)}
    it 'returns historical weather' do
      get '/weather/historical' do

        expect(response.body).to eq(weathers).as_json

      end
    end
  end
  context "max temperature" do
    let(:weather) { Weather.where(time: (Time.now - 1.day)..Time.now).maximum(:temperature) }
    it 'returns max temperature' do
      get '/weather/historical/max' do
        expect(JSON.parse(response.body)).to eq(weather).as_json
      end
    end
  end
  context "min temperature" do
    let(:weather) { Weather.where(time: (Time.now - 1.day)..Time.now).minimum(:temperature) }
    it 'returns min temperature' do
      get '/weather/historical/min' do
        expect(JSON.parse(response.body)).to eq(weather).as_json
      end
    end
  end
  context "average temperature" do
    let(:weather) { Weather.where(time: (Time.now - 1.day)..Time.now).maximum(:temperature) }
    it 'returns average temperature' do
      get '/weather/historical/avg' do
        expect(JSON.parse(response.body)).to eq(weather).as_json
      end
    end
  end
end