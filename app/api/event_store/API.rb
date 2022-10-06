module EventStore
  class API < Grape::API
    version 'v2', using: :path
    format :json
    prefix :api
    mount EventStore::V2::Events
  end
end
