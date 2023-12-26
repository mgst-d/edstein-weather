require 'rufus-scheduler'

scheduler = Rufus::Scheduler::singleton

scheduler.every '1h' do
  current_weather = JSON.parse(AccuweatherService.new.current_weather.boby)
  time = current_weather['LocalObservationDateTime']
  temperature = current_weather['Temperature']['Metric']['Value']
  Weather.new(time: time, temperature: temp).save
end

scheduler.in '1s' do
  if Weather.last
    last_time = Weather.last.time
  end
  historical_weather = JSON.parse(AccuweatherService.new.historical_weather.body)
  historical_weather.reverse_each do |historical_weather_1|
    time = historical_weather_1['LocalObservationDateTime']
    temperature = historical_weather_1['Temperature']['Metric']['Value']
    if !last_time
      Weather.new(time: time, temperature: temperature).save
    else
      if last_time < time
        Weather.new(time: time, temperature: temperature).save
      end
    end
  end
end