module EventStore
  module V2
    class Events < EventStore::API
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
