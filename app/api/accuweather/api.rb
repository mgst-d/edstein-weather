
module Accuweather
  class API < Grape::API
    version 'v1', using: :header, vendor: 'accuweather'
    format :json
    # prefix :api
  
    resource :weather do
      desc 'Returns current weather'
      get :current do
        Weather.last.as_json(:only => [:time, :temperature])
      end

      desc 'Returns historical weather'
      resource :historical do

        desc 'Returns historical weather'
        get :/ do
          Weather.where(time: (Time.now - 1.day)..Time.now).as_json(:only => [:time, :temperature])
        end

        desc 'Returns max weather'
        get :max do
          JSON.generate(Weather.where(time: (Time.now - 1.day)..Time.now).maximum(:temperature))
        end
  
        desc 'Returns avg weather'
        get :avg do
          JSON.generate(Weather.where(time: (Time.now - 1.day)..Time.now).average(:temperature))
        end

        desc 'Returns min weather'
        get :min do
          JSON.generate(Weather.where(time: (Time.now - 1.day)..Time.now).minimum(:temperature))
        end
   
      end
      resource :by_time do
        params do
          requires :time, type: Integer, desc: "Received time"
        end
        route_param :time do
          get do
            nearest_time = Weather.where("time < ? ", (params[:time]).to_datetime).order("time desc").limit(1)

            if nearest_time.blank?
              status 404
            else
              nearest_time.as_json(:only => [:time, :temperature])
            end
          end
        end
      end
    end

    get :health do
      status :ok
    end

  end
end
