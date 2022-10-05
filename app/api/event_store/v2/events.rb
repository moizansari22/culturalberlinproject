module EventStore
    module V2
      class Events< Grape::API
        version 'v2', using: :path
        format :json
        prefix :api
        resource :events do
          desc 'Return list of events'
          get do
            events = Event.all
            present events
          end
        end
      end
    end
end