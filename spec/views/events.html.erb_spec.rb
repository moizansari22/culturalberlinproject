require "rails_helper"

RSpec.describe "events/index" do
  it "displays all the Event" do
    allow(view).to receive_messages(:will_paginate => nil)
    assign(:events, [
      Event.create!(:title => "slicer",:teaser => "lorem " , :bar => "panorama", :websource => "berlinevent")
    ])

    render
    expect(rendered).to match(/events/)
  end
end
