
module Accuweather
  class API < Grape::API
    version 'v1', using: :header, vendor: 'accuweather'
    format :json
    # prefix :api
  
    resource :weather do
      desc 'Returns current weather'
      get :current do
        'hi world'
      end

      desc 'Returns historical weather'
      resource :historical do
        desc 'Returns max weather'
        get :max do
          'max'
        end
  
        desc 'Returns avg weather'
        get :avg do
          'avg'
        end

        desc 'Returns min weather'
        get :min do
          'min'
        end
      end

      
      get :by_time do
        'by_time'
      end
    end

    get :health do
      status 200
    end

  end
end
