require "rails_helper"

RSpec.describe "routes for Events", :type => :routing do
  it "routes /events to the Event controller" do
    expect(get("/events")).
      to route_to("events#index")
  end

  it "routes search_date/events to the search_date controller" do
    expect(get("search_date/events")).
      to route_to("events#search_date")
  end
end
