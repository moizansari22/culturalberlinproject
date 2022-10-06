module EventStore
    class Base < Grape::API
      mount EventStore::V2::Events
    end
end
